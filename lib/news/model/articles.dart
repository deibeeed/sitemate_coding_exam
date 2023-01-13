import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sitemate_coding_exam/news/model/article_source.dart';

part 'articles.g.dart';

@JsonSerializable()
class Articles extends Equatable {
  final ArticleSource source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Articles({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}
