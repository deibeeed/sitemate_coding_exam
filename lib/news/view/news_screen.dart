import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitemate_coding_exam/news/bloc/news_bloc.dart';
import 'package:sitemate_coding_exam/news/view/news_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsScreen extends StatelessWidget {
  final newsSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<NewsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('News on demand'),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: newsSearchController,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => newsBloc.getNewsArticles(
                            query: newsSearchController.text),
                        child: Icon(Icons.check))
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  final article = newsBloc.articles[index];
                  return Card(
                    child: ListTile(
                      title: Text(article.title),
                      subtitle: Text(
                        article.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      isThreeLine: true,
                      onTap: () async {
                        await launchUrlString(
                            article.url,
                          mode: LaunchMode.externalApplication,);
                      },
                    ),
                  );
                },
                itemCount: newsBloc.articles.length,
              ))
            ],
          );
        },
      ),
    );
  }
}
