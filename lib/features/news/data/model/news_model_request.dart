import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model_request.g.dart';

@JsonSerializable()
class NewsModelRequest {
  final String language;

  @JsonKey(name: "q")
  final String category;

  final String apiKey;

  NewsModelRequest(
      {required this.language, required this.category, required this.apiKey});

  Map<String, dynamic> toJson() => _$NewsModelRequestToJson(this);
}
