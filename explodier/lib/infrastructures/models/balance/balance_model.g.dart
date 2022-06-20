// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceResponseModel _$BalanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    BalanceResponseModel(
      BalanceModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BalanceResponseModelToJson(
        BalanceResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) => BalanceModel(
      address: json['address'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      nextUpdateAt: json['next_update_at'] == null
          ? null
          : DateTime.parse(json['next_update_at'] as String),
      quoteCurrency: json['quote_currency'] as String?,
      chainID: json['chain_id'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BalanceItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'next_update_at': instance.nextUpdateAt?.toIso8601String(),
      'quote_currency': instance.quoteCurrency,
      'chain_id': instance.chainID,
      'items': instance.items,
    };

BalanceItemModel _$BalanceItemModelFromJson(Map<String, dynamic> json) =>
    BalanceItemModel(
      json['contract_decimals'] as int?,
      json['contract_name'] as String?,
      json['contract_ticker_symbol'] as String?,
      json['contract_address'] as String?,
      (json['supports_erc'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['logo_url'] as String?,
      json['last_transferred_at'] == null
          ? null
          : DateTime.parse(json['last_transferred_at'] as String),
      json['type'] as String?,
      json['balance'] as String?,
      json['balance_24h'] as String?,
      (json['quote_rate'] as num?)?.toDouble(),
      (json['quote_rate_24h'] as num?)?.toDouble(),
      (json['quote'] as num?)?.toDouble(),
      (json['quote_24h'] as num?)?.toDouble(),
      json['nft_data'] as String?,
    );

Map<String, dynamic> _$BalanceItemModelToJson(BalanceItemModel instance) =>
    <String, dynamic>{
      'contract_decimals': instance.contractDecimals,
      'contract_name': instance.contractName,
      'contract_ticker_symbol': instance.contractTickerSymbol,
      'contract_address': instance.contractAddress,
      'supports_erc': instance.supportsErc,
      'logo_url': instance.logoUrl,
      'last_transferred_at': instance.lastTransferredAt?.toIso8601String(),
      'type': instance.type,
      'balance': instance.balance,
      'balance_24h': instance.balance24h,
      'quote_rate': instance.quoteRate,
      'quote_rate_24h': instance.quoteRate24h,
      'quote': instance.quote,
      'quote_24h': instance.quote24h,
      'nft_data': instance.nftData,
    };
