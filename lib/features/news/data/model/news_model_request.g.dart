// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModelRequest _$NewsModelRequestFromJson(Map<String, dynamic> json) =>
    NewsModelRequest(
      language: json['language'] as String,
      category: json['q'] as String,
      apiKey: json['apiKey'] as String,
    );

Map<String, dynamic> _$NewsModelRequestToJson(NewsModelRequest instance) =>
    <String, dynamic>{
      'language': instance.language,
      'q': instance.category,
      'apiKey': instance.apiKey,
    };
