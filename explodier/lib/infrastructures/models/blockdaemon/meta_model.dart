import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@immutable
@JsonSerializable()
class MetaModel {
  final PagingModel? paging;

  const MetaModel({this.paging});

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}

@immutable
@JsonSerializable()
class PagingModel {
  @JsonKey(name: 'updatnext_page_tokened_at')
  final String? nextPageToken;

  const PagingModel({this.nextPageToken});

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagingModelToJson(this);
}
