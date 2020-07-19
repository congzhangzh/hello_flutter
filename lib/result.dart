import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function restart;
  final int _totalScore;
  const Result(
    this.restart,
    this._totalScore, {
    Key key,
  }) : super(key: key);

  String get resultPhrase {
    var resultText = 'Your did it!';

    if (_totalScore <= 8) {
      resultText = 'YOu are awesome';
    } else if (_totalScore < 24) {
      resultText = 'youe are great';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text("you score $_totalScore"),
          RaisedButton(
            child: Text('restart'),
            onPressed: restart,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: restart,
          )
        ]));
  }
}
