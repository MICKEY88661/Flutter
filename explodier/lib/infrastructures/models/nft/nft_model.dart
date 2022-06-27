import 'package:explodier/infrastructures/models/pagination/pagination_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nft_model.g.dart';

@immutable
@JsonSerializable()
class NftModel {
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<NftItemModel>? items;
  final PaginationModel? pagination;

  const NftModel({
    this.updatedAt,
    this.items,
    this.pagination,
  });

  factory NftModel.fromJson(Map<String, dynamic> json) =>
      _$NftModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftModelToJson(this);
}

@immutable
@JsonSerializable()
class NftItemModel {
  @JsonKey(name: 'contract_decimals')
  final int? contractDecimals;
  @JsonKey(name: 'contract_name')
  final String? contractName;
  @JsonKey(name: 'contract_ticker_symbol')
  final String? contractTickerSymbol;
  @JsonKey(name: 'contract_address')
  final String? contractAddress;
  @JsonKey(name: 'supports_erc')
  final List<String>? supportsErc;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'token_id')
  final String? tokenId;

  const NftItemModel({
    this.contractDecimals,
    this.contractName,
    this.contractTickerSymbol,
    this.contractAddress,
    this.supportsErc,
    this.logoUrl,
    this.tokenId,
  });

  factory NftItemModel.fromJson(Map<String, dynamic> json) =>
      _$NftItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftItemModelToJson(this);
}
