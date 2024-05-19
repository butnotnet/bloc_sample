import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exam_page.dart';
import 'results_page.dart';
import 'score_bloc.dart';
import 'simple_bloc_observer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = SimpleBlockObserver();
    return BlocProvider(
      create: (context) => ScoreBloc(),
      child: MaterialApp(
          title: 'BLoC Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => const ExamPage(),
            '/results': (context) => const ResultPage(),
          }),
    );
  }
}
