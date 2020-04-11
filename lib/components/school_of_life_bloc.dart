import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialise/utilities/constants.dart';

final Firestore _firestore = Firestore.instance;

Future<List> setRoomQuestions() async {
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
    return [];
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

    return _questionSet;
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
  Map _questionSelected = {};
  int questionCount;
  bool questionCountError = false;

  @override
  void initState() {
    _questionSet = widget.questionSet;
    questionCount = widget.questionSet.length;

    for (int i = 0; i < _questionSet.length; i++) {
      _questionSelected[_questionSet[i]] = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_questionSet == null) {
      return Container();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                  child: Text('Must select a minimum of 4 questions',
                      style:
                          questionCountError ? kP1ErrorMessage : kP1LightGrey)),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: 20.0,
                              child: RaisedButton(
                                child: Text(
                                  'Done',
                                ),
                                color: Colors.blueAccent,
                                elevation: 5,
                                onPressed: () {
                                  setState(() {
                                    //TODO make this pull in the correct name.
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                textColor: Colors.white,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.greenAccent,
                                  size: 25,
                                ),
                                Text('$questionCount Selected'),
                              ],
                            ),

                            //TODO update based on selected question count.
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        child: ListView.builder(
                            itemCount: _questionSet.length,
                            itemBuilder: (BuildContext context, int index) {
                              // question not selected by default.

                              return GestureDetector(
                                onTap: () {
                                  print('pressed');
                                  setState(() {
                                    if (questionCount == 4 &&
                                        !_questionSelected[
                                            _questionSet[index]]) {
                                      print('problem');
                                      questionCountError = true;
                                    } else {
                                      questionCountError = false;
                                      _questionSelected[_questionSet[index]] =
                                          !_questionSelected[
                                              _questionSet[index]];
                                      _questionSelected[_questionSet[index]]
                                          ? questionCount--
                                          : questionCount++;
                                    }
                                  });
                                },
                                child: Container(
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
                                    color:
                                        _questionSelected[_questionSet[index]]
                                            ? Colors.purple[100]
                                            : Colors.white,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(_questionSet[index]),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
