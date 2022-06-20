import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable()
class BalanceResponseModel {
  final BalanceModel data;
  // final bool? error;
  // final String? error_message;
  // final String? error_code;

  BalanceResponseModel(this.data);

  factory BalanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceResponseModelToJson(this);
}

@JsonSerializable()
class BalanceModel {
  final String? address;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'next_update_at')
  final DateTime? nextUpdateAt;
  @JsonKey(name: 'quote_currency')
  final String? quoteCurrency;
  @JsonKey(name: 'chain_id')
  final int? chainID;
  final List<BalanceItemModel?>? items;

  BalanceModel({
    required this.address,
    required this.updatedAt,
    required this.nextUpdateAt,
    required this.quoteCurrency,
    required this.chainID,
    required this.items,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);
}

@JsonSerializable()
class BalanceItemModel {
  @JsonKey(name: 'contract_decimals')
  final int? contractDecimals;
  @JsonKey(name: 'contract_name')
  final String? contractName;
  @JsonKey(name: 'contract_ticker_symbol')
  final String? contractTickerSymbol;
  @JsonKey(name: 'contract_address')
  final String? contractAddress;
  @JsonKey(name: 'supports_erc')
  final List<String?>? supportsErc;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'last_transferred_at')
  final DateTime? lastTransferredAt;
  final String? type;
  final String? balance;
  @JsonKey(name: 'balance_24h')
  final String? balance24h;
  @JsonKey(name: 'quote_rate')
  final double? quoteRate;
  @JsonKey(name: 'quote_rate_24h')
  final double? quoteRate24h;
  final double? quote;
  @JsonKey(name: 'quote_24h')
  final double? quote24h;
  @JsonKey(name: 'nft_data')
  final String? nftData;

  BalanceItemModel(
    this.contractDecimals,
    this.contractName,
    this.contractTickerSymbol,
    this.contractAddress,
    this.supportsErc,
    this.logoUrl,
    this.lastTransferredAt,
    this.type,
    this.balance,
    this.balance24h,
    this.quoteRate,
    this.quoteRate24h,
    this.quote,
    this.quote24h,
    this.nftData,
  );

  factory BalanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceItemModelToJson(this);
}
