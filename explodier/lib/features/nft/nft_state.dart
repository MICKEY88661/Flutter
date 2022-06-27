import 'package:equatable/equatable.dart';
import 'package:explodier/infrastructures/models/nft/nft_metadata_model.dart';
import 'package:explodier/infrastructures/models/nft/nft_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NftState extends Equatable {
  final AsyncValue<NftModel> nft;
  final AsyncValue<List<NftExternalDataModel?>> nftExternalDatas;

  const NftState({
    required this.nft,
    required this.nftExternalDatas,
  });

  NftState copyWith({
    AsyncValue<NftModel>? nft,
    AsyncValue<List<NftExternalDataModel?>>? nftExternalDatas,
  }) {
    return NftState(
      nft: nft ?? this.nft,
      nftExternalDatas: nftExternalDatas ?? this.nftExternalDatas,
    );
  }

  @override
  List<Object?> get props => [nft, nftExternalDatas];
}
