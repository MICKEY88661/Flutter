// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftModel _$NftModelFromJson(Map<String, dynamic> json) => NftModel(
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => NftItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NftModelToJson(NftModel instance) => <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'items': instance.items,
      'pagination': instance.pagination,
    };

NftItemModel _$NftItemModelFromJson(Map<String, dynamic> json) => NftItemModel(
      contractDecimals: json['contract_decimals'] as int?,
      contractName: json['contract_name'] as String?,
      contractTickerSymbol: json['contract_ticker_symbol'] as String?,
      contractAddress: json['contract_address'] as String?,
      supportsErc: (json['supports_erc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      logoUrl: json['logo_url'] as String?,
      tokenId: json['token_id'] as String?,
    );

Map<String, dynamic> _$NftItemModelToJson(NftItemModel instance) =>
    <String, dynamic>{
      'contract_decimals': instance.contractDecimals,
      'contract_name': instance.contractName,
      'contract_ticker_symbol': instance.contractTickerSymbol,
      'contract_address': instance.contractAddress,
      'supports_erc': instance.supportsErc,
      'logo_url': instance.logoUrl,
      'token_id': instance.tokenId,
    };
