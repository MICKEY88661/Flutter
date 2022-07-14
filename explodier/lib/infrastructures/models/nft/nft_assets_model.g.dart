// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_assets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftModel _$NftModelFromJson(Map<String, dynamic> json) => NftModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NftAssetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NftModelToJson(NftModel instance) => <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

NftAssetModel _$NftAssetModelFromJson(Map<String, dynamic> json) =>
    NftAssetModel(
      id: json['id'] as String?,
      tokenId: json['token_id'] as String?,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      contractAddress: json['contract_address'] as String?,
      wallets:
          (json['wallets'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NftAssetModelToJson(NftAssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token_id': instance.tokenId,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'contract_address': instance.contractAddress,
      'wallets': instance.wallets,
    };
