import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

enum SocreStatus { initial, correct, wrong }

class ScoreState extends Equatable {
  const ScoreState({
    this.correct = 0,
    this.wrong = 0,
  });

  final int correct;
  final int wrong;

  @override
  List<Object?> get props => [correct, wrong];

  ScoreState copyWith({
    int? correct,
    int? wrong,
  }) {
    return ScoreState(
      correct: correct ?? this.correct,
      wrong: wrong ?? this.wrong,
    );
  }
}

abstract class ScoreEvent {}
class CorrectPress extends ScoreEvent {}
class WrongPress extends ScoreEvent {}

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(const ScoreState()) {
    on<CorrectPress>(
        (event, emit) => emit(state.copyWith(correct: state.correct + 1)));
    on<WrongPress>(
        (event, emit) => emit(state.copyWith(wrong: state.wrong + 1)));
  }

  @override
  void onChange(Change<ScoreState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<ScoreEvent, ScoreState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
