import 'package:equatable/equatable.dart';
import 'package:explodier/infrastructures/models/nft/nft_assets_model.dart';
import 'package:explodier/infrastructures/models/nft/v_nft_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NftState extends Equatable {
  final AsyncValue<List<NftAssetModel>?> nfts;
  final AsyncValue<List<NftItemViewModel>?> nftItems;

  const NftState({
    required this.nfts,
    required this.nftItems,
  });

  NftState copyWith({
    AsyncValue<List<NftAssetModel>?>? nfts,
    AsyncValue<List<NftItemViewModel>?>? nftItems,
  }) {
    return NftState(
      nfts: nfts ?? this.nfts,
      nftItems: nftItems ?? this.nftItems,
    );
  }

  @override
  List<Object?> get props => [nfts, nftItems];
}
