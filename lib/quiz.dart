import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key key,
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }),
      ],
    );
  }
}
