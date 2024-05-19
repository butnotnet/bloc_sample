import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'score_bloc.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    var title = 'Flutter Demo Home Page';
    return ExamView(title: title);
  }
}

class ExamView extends StatelessWidget {
  const ExamView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '問題',
            ),
            const Text(
              '解答',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () =>
                      context.read<ScoreBloc>().add(CorrectPress()),
                  child: const Text('正答'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => context.read<ScoreBloc>().add(WrongPress()),
                  child: const Text('誤答'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/results'),
        tooltip: '結果',
        child: const Text('結果'),
      ),
    );
  }
}
