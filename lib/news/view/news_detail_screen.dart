import 'package:flutter/material.dart';
import 'package:sitemate_coding_exam/news/model/articles.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({required this.article}): super();
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(article.content),
      ),
    );
  }

}