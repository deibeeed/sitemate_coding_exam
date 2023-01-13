part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsArticlesRetrieveState extends NewsState {
  const NewsArticlesRetrieveState({ required this.status, required this.articles });
  final List<Articles> articles;
  final String status;

  @override
  List<Object?> get props => [
    articles,
    status
  ];
}

class NewsError extends NewsState {
  const NewsError({ required this.errorMessage }): super();
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}