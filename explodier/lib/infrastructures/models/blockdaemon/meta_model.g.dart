// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      paging: json['paging'] == null
          ? null
          : PagingModel.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'paging': instance.paging,
    };

PagingModel _$PagingModelFromJson(Map<String, dynamic> json) => PagingModel(
      nextPageToken: json['updatnext_page_tokened_at'] as String?,
    );

Map<String, dynamic> _$PagingModelToJson(PagingModel instance) =>
    <String, dynamic>{
      'updatnext_page_tokened_at': instance.nextPageToken,
    };
