import 'package:explodier/features/nft/nft_state.dart';
import 'package:explodier/infrastructures/models/nft/nft_metadata_model.dart';
import 'package:explodier/infrastructures/repositories/nft_repository.dart';
import 'package:explodier/infrastructures/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nftCtrlProvider =
    StateNotifierProvider.autoDispose<NftController, NftState>((ref) {
  final nftRepo = ref.watch(nftRepoProvider);
  final userRepo = ref.watch(userRepoProvider);

  return NftController(
    const NftState(
      nft: AsyncLoading(),
      nftExternalDatas: AsyncLoading(),
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
    getNftTokenIds();
  }

  Future<void> getNftTokenIds() async {
    try {
      state = state.copyWith(nft: const AsyncLoading());
      final user = userFacade.currentUser;
      final nft = await nftFacade.getNftTokenIds(
        //"0xe4605d46fd0b3f8329d936a8b258d69276cba264",
        contractAddress: user.walletAddress,
        chainId: 1,
      );
      state = state.copyWith(nft: AsyncData(nft));
      getNftMetadata();
    } catch (e) {
      state = state.copyWith(nft: AsyncError(e));
    }
  }

  Future<void> getNftMetadata() async {
    try {
      state = state.copyWith(nftExternalDatas: const AsyncLoading());

      List<NftExternalDataModel> metadatas = [];

      if (state.nft.value?.items != null) {
        for (final nftItem in state.nft.value!.items!) {
          if (nftItem.contractAddress == null || nftItem.tokenId == null) {
            return;
          }

          final nftMetadata = await nftFacade.getNftExternalMetadata(
            //"0x3CAb982C10ca41f1a1992815b9185375c472cedc",
            contractAddress: nftItem.contractAddress!,
            tokenId: nftItem.tokenId!,
            chainId: 1,
          );

          if (nftMetadata.items == null) {
            return;
          }
          for (var item in nftMetadata.items!) {
            if (item.nftData == null) {
              return;
            }
            for (var nftData in item.nftData!) {
              metadatas.add(nftData.externalData!);
            }
          }
        }
      }
      print(metadatas.length);
      state = state.copyWith(
        nftExternalDatas: AsyncData(metadatas),
      );
    } catch (e) {
      state = state.copyWith(nftExternalDatas: AsyncError(e));
    }
  }
}
