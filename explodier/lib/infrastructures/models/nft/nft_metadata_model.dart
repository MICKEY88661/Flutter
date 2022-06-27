import 'package:explodier/infrastructures/models/pagination/pagination_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nft_metadata_model.g.dart';

@immutable
@JsonSerializable()
class NftMetadataModel {
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  final List<NftMetadataItemModel>? items;
  final PaginationModel? pagination;

  const NftMetadataModel({
    this.updatedAt,
    this.items,
    this.pagination,
  });

  factory NftMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$NftMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftMetadataModelToJson(this);
}

@immutable
@JsonSerializable()
class NftMetadataItemModel {
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
  final String? type;
  @JsonKey(name: 'nft_data')
  final List<NftDataModel>? nftData;

  const NftMetadataItemModel({
    this.contractDecimals,
    this.contractName,
    this.contractTickerSymbol,
    this.contractAddress,
    this.supportsErc,
    this.logoUrl,
    this.type,
    this.nftData,
  });

  factory NftMetadataItemModel.fromJson(Map<String, dynamic> json) =>
      _$NftMetadataItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftMetadataItemModelToJson(this);
}

@immutable
@JsonSerializable()
class NftDataModel {
  @JsonKey(name: 'token_id')
  final String? tokenId;
  @JsonKey(name: 'token_balance')
  final String? tokenBalance;
  @JsonKey(name: "token_url")
  final String? tokenUrl;
  @JsonKey(name: "supports_erc")
  final List<String>? supportsErc;
  @JsonKey(name: "token_price_wei")
  final String? tokenPriceWei;
  @JsonKey(name: "token_quote_rate_eth")
  final String? tokenQuoteRateEth;
  @JsonKey(name: "original_owner")
  final String? originalOwner;
  @JsonKey(name: "external_data")
  final NftExternalDataModel? externalData;
  final String? owner;
  @JsonKey(name: "owner_address")
  final String? ownerAddress;
  final bool? burned;

  const NftDataModel({
    this.tokenId,
    this.tokenBalance,
    this.tokenUrl,
    this.supportsErc,
    this.tokenPriceWei,
    this.tokenQuoteRateEth,
    this.originalOwner,
    this.externalData,
    this.owner,
    this.ownerAddress,
    this.burned,
  });

  factory NftDataModel.fromJson(Map<String, dynamic> json) =>
      _$NftDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftDataModelToJson(this);
}

@immutable
@JsonSerializable()
class NftExternalDataModel {
  final String? name;
  final String? description;
  final String? image;
  @JsonKey(name: "image_256")
  final String? image256;
  @JsonKey(name: "image_512")
  final String? image512;
  @JsonKey(name: "image_1024")
  final String? image1024;
  @JsonKey(name: "animation_url")
  final String? animationUrl;
  @JsonKey(name: "external_url")
  final String? externalUrl;
  // final List? attributes;
  final String? owner;

  const NftExternalDataModel({
    this.name,
    this.description,
    this.image,
    this.image256,
    this.image512,
    this.image1024,
    this.animationUrl,
    this.externalUrl,
    this.owner,
  });

  factory NftExternalDataModel.fromJson(Map<String, dynamic> json) =>
      _$NftExternalDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftExternalDataModelToJson(this);
}
