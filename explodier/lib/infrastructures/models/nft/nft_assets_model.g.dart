// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_assets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
