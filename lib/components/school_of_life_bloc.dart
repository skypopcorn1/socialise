import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final Firestore _firestore = Firestore.instance;

void getQuestionSet({Function callback}) async {
  List _questionSet = [];
  Map _queryResults = {
    'easy': [],
    'medium': [],
    'hard': [],
  };

  final _fullQuestionSet = await _firestore
      .collection('activities')
      .document('UhO80iQ21olNUw5TCHzn')
      .collection('questions')
      .getDocuments();

  if (_fullQuestionSet.documents.isEmpty) {
    return callback([]);
  } else {
    for (var question in _fullQuestionSet.documents) {
      _queryResults[question.data['type']].add(
        question.data['topic'],
      );
    }

    //add easy questions to the list and set all to true (selected).
    for (int i = 0; i < 4; i++) {
      _questionSet.add(
        [
          _queryResults['easy'][Random().nextInt(_queryResults['easy'].length)],
          true
        ],
      );
    }

    //add medium questions to the list and set all to true (selected).
    _questionSet.add([
      _queryResults['medium'][Random().nextInt(_queryResults['medium'].length)],
      true
    ]);

    //add hard questions to the list and set all to true (selected).
    _questionSet.add([
      _queryResults['hard'][Random().nextInt(_queryResults['hard'].length)],
      true
    ]);

    return callback(_questionSet);
  }
}

class QuestionListView extends StatefulWidget {
  QuestionListView({this.questionSet});

  final List questionSet;
  @override
  _QuestionListViewState createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  List _questionSet;

  @override
  void initState() {
    _questionSet = widget.questionSet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_questionSet == null) {
      return Container();
    } else {
      return ListView.builder(
          itemCount: _questionSet.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(3, 3),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                  )
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(_questionSet[index][0]),
              ),
            );
          });
    }
  }
}
