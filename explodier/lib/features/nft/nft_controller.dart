import 'package:explodier/features/nft/nft_state.dart';
import 'package:explodier/infrastructures/models/nft/nft_metadata_model.dart';
import 'package:explodier/infrastructures/models/nft/v_nft_item_model.dart';
import 'package:explodier/infrastructures/repositories/nft_repository.dart';
import 'package:explodier/infrastructures/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nftCtrlProvider =
    StateNotifierProvider.autoDispose<NftController, NftState>((ref) {
  final nftRepo = ref.watch(nftRepoProvider);
  final userRepo = ref.watch(userRepoProvider);

  return NftController(
    const NftState(
      nfts: AsyncLoading(),
      nftItems: AsyncLoading(),
    ),
    nftFacade: nftRepo,
    userFacade: userRepo,
  );
});

class NftController extends StateNotifier<NftState> {
  final INftRpository nftFacade;
  final IUserRepostory userFacade;

  NftController(
    super.state, {
    required this.nftFacade,
    required this.userFacade,
  }) {
    init();
  }

  void init() async {
    await getNftAssets();
    await getNftItems();
  }

  Future<void> getNftAssets() async {
    try {
      state = state.copyWith(nfts: const AsyncLoading());
      final user = userFacade.currentUser;
      final nfts = await nftFacade.getUserNftAssets(
        walletAddress: user.walletAddress,
        chainId: 1,
      );
      state = state.copyWith(nfts: AsyncData(nfts));
    } catch (e) {
      state = state.copyWith(nfts: AsyncError(e));
    }
  }

  Future<void> getNftItems() async {
    try {
      state = state.copyWith(nftItems: const AsyncLoading());

      List<NftItemViewModel> items = [];

      // no nfts
      if (state.nfts.value == null || state.nfts.value == []) {
        state = state.copyWith(
          nftItems: AsyncData(items),
        );
        return;
      }

      for (final nft in state.nfts.value!) {
        if (nft.contractAddress == null || nft.tokenId == null) {
          break;
        }

        final nftMetadata = await nftFacade.getNftExternalMetadata(
          contractAddress: nft.contractAddress!,
          tokenId: nft.tokenId!,
          chainId: 1,
        );

        if (nftMetadata.items == null) {
          print("items null");
          break;
        }

        for (var item in nftMetadata.items!) {
          if (item.nftData == null) {
            print("nftData null");

            break;
          }

          for (var nftData in item.nftData!) {
            items.add(
              NftItemViewModel(
                imageURL: nft.imageUrl ?? nftData.externalData?.image,
                name: nft.name ?? nftData.externalData?.name,
                contractName: item.contractName,
              ),
            );
          }
        }
      }
      print("AsyncData");
      state = state.copyWith(
        nftItems: AsyncData(items),
      );
    } catch (e) {
      state = state.copyWith(nftItems: AsyncError(e));
    }
  }
}
