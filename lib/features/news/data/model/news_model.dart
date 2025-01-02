import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

@JsonSerializable()
class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}

@JsonSerializable()
class Source {
  String? name;

  Source({this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
