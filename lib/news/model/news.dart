import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sitemate_coding_exam/news/model/articles.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  const News({
    required this.status,
    required this.totalResults,
    required this.articles,
});

  @override
  List<Object?> get props => [
    status,
    totalResults,
    articles,
  ];

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}