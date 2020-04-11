import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({this.questionText, this.typeOfQuestion});
  final String questionText;
  final String typeOfQuestion;
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String _questionText;
  String _typeOfQuestion;

  @override
  void initState() {
    _questionText = widget.questionText;
    _typeOfQuestion = widget.typeOfQuestion;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Text(_questionText),
            )
          ],
        )
      ],
    );
  }
}
