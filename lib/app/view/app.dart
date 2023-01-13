import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitemate_coding_exam/counter/counter.dart';
import 'package:sitemate_coding_exam/l10n/l10n.dart';
import 'package:sitemate_coding_exam/news/bloc/news_bloc.dart';
import 'package:sitemate_coding_exam/news/view/news_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(),
        child: NewsScreen(),
      ),
    );
  }
}
