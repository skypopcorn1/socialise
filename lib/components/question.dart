import 'dart:async';

import 'package:flutter/material.dart';

const timeForEachQuestion = 2;

Color getQuestionBackground(String difficulty) {
  Map difficultyColorCodes = {
    'easy': Colors.greenAccent,
    'medium': Colors.blueAccent,
    'hard': Colors.redAccent
  };
  return difficultyColorCodes[difficulty];
}

class Question extends StatefulWidget {
  Question({this.questionList});
  final List questionList;
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool gameEnds = false;
  String questionText;
  bool testing = true;
  List questionList = [];
  int indexOfQuestion = 0;
  Timer _timer;
  int playerIndex;
  int timeLeft = timeForEachQuestion;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (timeLeft < 1) {
            // Player Switching
            if (playerIndex == 1) {
              playerIndex = 2;
              timeLeft = timeForEachQuestion;
            } else {
              // Moves to next question
              playerIndex = 1;
              indexOfQuestion++;
              timeLeft = timeForEachQuestion;
              if (indexOfQuestion > questionList.length - 1) {
                timer.cancel();
                indexOfQuestion = 0;
                gameEnds = true;
              } else {
                questionText = questionList[indexOfQuestion];
              }
            }
          } else {
            timeLeft = timeLeft - 1;
          }
        },
      ),
    );
    print(_timer.isActive);
  }

  void gameLogic(Timer timer) {}

  @override
  void initState() {
    questionList = testing ? ['q1', 'q2', 'q1', 'q2'] : widget.questionList;
    questionText = questionList[indexOfQuestion];
    playerIndex = 1;
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    if (gameEnds) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Do you want to play again?'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  gameEnds = false;
                  startTimer();
                },
                child: Text('Yes'),
              ),
              RaisedButton(
                onPressed: () => {Navigator.pop(context)},
                child: Text('No'),
              )
            ],
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Player $playerIndex turn'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: getQuestionBackground('easy'),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                    )),
                child: Text(questionText),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Time Left: $timeLeft '),
              )
            ],
          ),
        ],
      );
    }
  }
}
