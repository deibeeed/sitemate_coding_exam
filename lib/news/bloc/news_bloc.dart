import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sitemate_coding_exam/news/model/articles.dart';
import 'package:sitemate_coding_exam/news/model/news.dart';
import 'package:sitemate_coding_exam/service/news_api_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : _newsApiService = NewsApiService(), super(NewsInitial()) {
    // on<NewsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on(_retrieveNewsArticles);
    getNewsArticles();
  }

  final List<Articles> _articles = [];
  List<Articles> get articles => _articles;
  final List<Articles> _origArticles = [];
  int _currentPage = 1;
  bool _canRetrieve = true;
  final int _pageSize = 10;
  final NewsApiService _newsApiService;
  bool _isSearch = false;

  void getNewsArticles({ String? query, bool more = false}) {
    if (query == null) {
      _currentPage = _origArticles.length + 1;
      add(GetNewsArticlesEvent(page: _currentPage));
    } else {
      if (!more) {
        _currentPage = 1;
      }
      _isSearch = true;
      add(GetNewsArticlesEvent(page: _currentPage, query: query));
    }

  }

  Future<void> _retrieveNewsArticles(GetNewsArticlesEvent event, Emitter<NewsState> emit) async {
    if (!_canRetrieve) {
      emit(const NewsError(errorMessage: "You've reached the bottom"));
      return;
    }

    News news;
    if (!_isSearch) {
      news = await _newsApiService.getNewsArticles(page: event.page);
      _currentPage += news.articles.length;
      _articles.addAll(news.articles);
    } else {
      news = await _newsApiService.searchArticles(page: event.page, query: event.query!);
      if (event.page == 1) {
        _origArticles..clear()
        ..addAll(_articles);
      }
      _articles..clear()
      ..addAll(news.articles);
    }
    // update currentPage


    emit(NewsArticlesRetrieveState(status: news.status, articles: _articles));

    if (news.articles.length < _pageSize) {
      _canRetrieve = false;
    }
  }
}
