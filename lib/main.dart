import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'block', 'score': 1},
        {'text': 'red', 'score': 2},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 4},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 11},
        {'text': 'Snake', 'score': 12},
        {'text': 'Elephant', 'score': 13},
        {'text': 'Lion', 'score': 14},
      ],
    },
    {
      'questionText': 'What is your favorite instructor?',
      'answers': [
        {'text': 'A', 'score': 21},
        {'text': 'B', 'score': 22},
        {'text': 'C', 'score': 23},
        {'text': 'D', 'score': 24},
      ],
    },
  ];

  var _totalScore = 0;

  void answerQuestion(int score) {
    print("score is $score");
    var aBool = true;
    if (questionIndex < questions.length) {
      _totalScore += score;
      setState(() {
        questionIndex++; // = (questionIndex + 1) % questions.length;
      });
    }
    print(questionIndex);
    //print('Answer chosen!');
  }

  void restart() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });

    print('result is pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: questionIndex,
                answerQuestion: answerQuestion,
              )
            : Result(restart, this._totalScore),
      ),
    );
  }
}
