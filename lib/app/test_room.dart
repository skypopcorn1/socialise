import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialise/components/school_of_life_bloc.dart';

import 'package:socialise/utilities/constants.dart';

class ChatRoomTestPage extends StatefulWidget {
  @override
  _ChatRoomTestPageState createState() => _ChatRoomTestPageState();
}

class _ChatRoomTestPageState extends State<ChatRoomTestPage> {
  bool testing = true;
  bool _inCalling = true;
  Widget _questionListView = Container(); //initialise with an empty container

  void updateQuestionList(questionSet) {
    setState(() {
      print('callback questionSet: $questionSet');
      _questionListView = QuestionListView(questionSet: questionSet);
    });
  }

  @override
  initState() {
    super.initState();
    getQuestionSet(callback: updateQuestionList);
//    initRenderers();
  }

  @override
  Widget build(BuildContext context) {
    double _smallVideoHeight = MediaQuery.of(context).size.height * 0.25;
    double _smallVideoWidth = MediaQuery.of(context).size.width * 0.5;
    double _outermargin = MediaQuery.of(context).size.width * 0.025;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: testing
                            ? Icon(Icons.videocam_off,
                                color: Colors.white, size: 40)
                            : Container(),
//                    : new RTCVideoView(_localRenderer),
                        height: _smallVideoHeight,
                        width: _smallVideoWidth,
                        decoration: new BoxDecoration(color: Colors.lightBlue),
                      ),
                      Container(
                        child: testing
                            ? Icon(Icons.videocam_off,
                                color: Colors.white, size: 40)
                            : Container(),
//                    : new RTCVideoView(_remoteRenderer),
                        height: _smallVideoHeight,
                        width: _smallVideoWidth,
                        decoration: new BoxDecoration(
                          color: Colors.lightBlue,
                          border: Border.all(color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                          child: Text('Select a minimum of 4 questions',
                              style: kP1LightGrey)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _outermargin),
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
                                    _questionListView =
                                        Text('Waiting on Jeremiah');
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
                                Text(' 6 Selected'),
                              ],
                            ),
                            //TODO update based on selected question count.
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(child: _questionListView),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
//        onPressed: _inCalling ? _hangUp : _makeCall,
        onPressed: () {
          print('make a call');
        },
        tooltip: _inCalling ? 'Hangup' : 'Call',
        child: new Icon(_inCalling ? Icons.call_end : Icons.phone),
      ),
    );
  }
}
