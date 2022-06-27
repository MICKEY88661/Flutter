// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      hasMore: json['has_more'] as bool?,
      pageNumber: json['page_number'] as int?,
      pageSize: json['page_size'] as int?,
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'total_count': instance.totalCount,
    };
