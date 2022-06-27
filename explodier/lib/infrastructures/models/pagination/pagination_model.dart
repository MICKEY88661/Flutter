import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@immutable
@JsonSerializable()
class PaginationModel {
  @JsonKey(name: 'has_more')
  final bool? hasMore;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'total_count')
  final int? totalCount;

  const PaginationModel({
    this.hasMore,
    this.pageNumber,
    this.pageSize,
    this.totalCount,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}
