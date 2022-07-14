import 'package:explodier/infrastructures/models/blockdaemon/meta_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nft_assets_model.g.dart';

@immutable
@JsonSerializable()
class NftModel {
  final List<NftAssetModel>? data;
  final MetaModel? meta;

  const NftModel({
    this.data,
    this.meta,
  });

  factory NftModel.fromJson(Map<String, dynamic> json) =>
      _$NftModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftModelToJson(this);
}

@immutable
@JsonSerializable()
class NftAssetModel {
  final String? id;
  @JsonKey(name: 'token_id')
  final String? tokenId;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final String? name;
  @JsonKey(name: 'contract_address')
  final String? contractAddress;
  final List<String>? wallets;

  const NftAssetModel({
    this.id,
    this.tokenId,
    this.imageUrl,
    this.name,
    this.contractAddress,
    this.wallets,
  });

  factory NftAssetModel.fromJson(Map<String, dynamic> json) =>
      _$NftAssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftAssetModelToJson(this);
}
