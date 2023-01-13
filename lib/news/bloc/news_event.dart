part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetNewsArticlesEvent extends NewsEvent {
  const GetNewsArticlesEvent({ required this.page, this.query }): super();

  final int page;
  final String? query;

  @override
  List<Object?> get props => [
    page,
    query
  ];

}