import 'dart:convert';

import 'package:sitemate_coding_exam/news/model/news.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  static const _API_KEY = "168ad7911f9048b3a99ef9dd365d929a";

  Future<News> getNewsArticles({ int pageSize = 10, int page = 1}) async {
    final url = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$_API_KEY&pageSize=$pageSize&page=$page';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    final data = News.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return data;
  }

  Future<News> searchArticles({ required String query, int pageSize = 10, int page = 1}) async {
    final url = 'https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=$_API_KEY';

    final response = await http.get(Uri.parse(url));
    print(response.body);
    final data = News.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return data;
  }
}