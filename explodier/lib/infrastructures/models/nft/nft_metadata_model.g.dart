// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftMetadataModel _$NftMetadataModelFromJson(Map<String, dynamic> json) =>
    NftMetadataModel(
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => NftMetadataItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NftMetadataModelToJson(NftMetadataModel instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'items': instance.items,
      'pagination': instance.pagination,
    };

NftMetadataItemModel _$NftMetadataItemModelFromJson(
        Map<String, dynamic> json) =>
    NftMetadataItemModel(
      contractDecimals: json['contract_decimals'] as int?,
      contractName: json['contract_name'] as String?,
      contractTickerSymbol: json['contract_ticker_symbol'] as String?,
      contractAddress: json['contract_address'] as String?,
      supportsErc: (json['supports_erc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      logoUrl: json['logo_url'] as String?,
      type: json['type'] as String?,
      nftData: (json['nft_data'] as List<dynamic>?)
          ?.map((e) => NftDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NftMetadataItemModelToJson(
        NftMetadataItemModel instance) =>
    <String, dynamic>{
      'contract_decimals': instance.contractDecimals,
      'contract_name': instance.contractName,
      'contract_ticker_symbol': instance.contractTickerSymbol,
      'contract_address': instance.contractAddress,
      'supports_erc': instance.supportsErc,
      'logo_url': instance.logoUrl,
      'type': instance.type,
      'nft_data': instance.nftData,
    };

NftDataModel _$NftDataModelFromJson(Map<String, dynamic> json) => NftDataModel(
      tokenId: json['token_id'] as String?,
      tokenBalance: json['token_balance'] as String?,
      tokenUrl: json['token_url'] as String?,
      supportsErc: (json['supports_erc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tokenPriceWei: json['token_price_wei'] as String?,
      tokenQuoteRateEth: json['token_quote_rate_eth'] as String?,
      originalOwner: json['original_owner'] as String?,
      externalData: json['external_data'] == null
          ? null
          : NftExternalDataModel.fromJson(
              json['external_data'] as Map<String, dynamic>),
      owner: json['owner'] as String?,
      ownerAddress: json['owner_address'] as String?,
      burned: json['burned'] as bool?,
    );

Map<String, dynamic> _$NftDataModelToJson(NftDataModel instance) =>
    <String, dynamic>{
      'token_id': instance.tokenId,
      'token_balance': instance.tokenBalance,
      'token_url': instance.tokenUrl,
      'supports_erc': instance.supportsErc,
      'token_price_wei': instance.tokenPriceWei,
      'token_quote_rate_eth': instance.tokenQuoteRateEth,
      'original_owner': instance.originalOwner,
      'external_data': instance.externalData,
      'owner': instance.owner,
      'owner_address': instance.ownerAddress,
      'burned': instance.burned,
    };

NftExternalDataModel _$NftExternalDataModelFromJson(
        Map<String, dynamic> json) =>
    NftExternalDataModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      image256: json['image_256'] as String?,
      image512: json['image_512'] as String?,
      image1024: json['image_1024'] as String?,
      animationUrl: json['animation_url'] as String?,
      externalUrl: json['external_url'] as String?,
      owner: json['owner'] as String?,
    );

Map<String, dynamic> _$NftExternalDataModelToJson(
        NftExternalDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'image_256': instance.image256,
      'image_512': instance.image512,
      'image_1024': instance.image1024,
      'animation_url': instance.animationUrl,
      'external_url': instance.externalUrl,
      'owner': instance.owner,
    };
