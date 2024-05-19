import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'score_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var title = 'Result Page';
    return ResultView(title: title);
  }
}

class ResultView extends StatelessWidget {
  const ResultView({
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
        child: BlocBuilder<ScoreBloc, ScoreState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '正答数 : ${state.correct}',
                ),
                Text(
                  '誤答数 : ${state.wrong}',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
