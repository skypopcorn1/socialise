import 'package:flutter/material.dart';
import 'package:socialise/components/school_of_life_bloc.dart';
import 'package:socialise/utilities/constants.dart';
import 'package:socialise/utilities/room_id_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'RoomConfirmation.dart';

class CreateRoomPage extends StatefulWidget {
  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  final Firestore _firestore = Firestore.instance;

  Widget maxParticipantsErrorMessage =
      Container(); //initialize with an empty string.
  int maxParticipants = 2;
  bool publicRoom = false;
  String roomName;
  static bool testing = true;
  int testRoomCounter = 1;
  Map roomDetails = testing
      ? {
          'room': 'Test Room 1',
          'activity': 'dating',
          'participants': 3,
          'public': false,
          'code': 'no change',
        }
      : {
          'room': null,
          'activity': null,
          'participants': null,
          'public': false,
          'code': null,
        };

  @override
  Widget build(BuildContext context) {
    double _outerMargins = MediaQuery.of(context).size.width * 0.025;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 80),
              child: Center(
                child: Text(
                  'Create Room',
                  style: kH1Dark,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'public room ',
                  style: kP1LightGrey,
                ),
                Switch(
                  activeTrackColor: kBlue,
                  inactiveTrackColor: Colors.blue[200],
                  value: publicRoom,
                  onChanged: (value) {
                    print('$value');
                    setState(() {
                      publicRoom = !publicRoom;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _outerMargins, horizontal: _outerMargins),
              child: TextFormField(
//              focusNode: focusUserName,
                onFieldSubmitted: (value) {
                  print('final value: $value');
                  //                FocusScope.of(context).requestFocus(focusPassword);
                },
                onChanged: (value) {
                  roomDetails['room'] = value;
                  print('roomDetails[room]: ${roomDetails['room']}');
                },
                style: TextStyle(
                  color: kGrey,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter a room name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _outerMargins, horizontal: _outerMargins),
              child: TextFormField(
//              focusNode: focusUserName,
                onFieldSubmitted: (value) {
//                FocusScope.of(context).requestFocus(focusPassword);
                },
                onChanged: (value) {
//                email = value;
                },
                style: TextStyle(
                  color: kGrey,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Select an activity',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  child: RaisedButton(
                    onPressed: () {
                      if (maxParticipants == 2) {
                        setState(() {
                          maxParticipantsErrorMessage = Text(
                            'Sorry you can\'t have less than two users on a video chat at this time.',
                            textAlign: TextAlign.center,
                            style: kErrorMessage,
                          );
                        });
                      } else {
                        setState(() {
                          maxParticipantsErrorMessage = Container();
                          maxParticipants--; //decrement number of participants
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: Colors.grey[500],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  maxParticipants.toString(),
                  style: kH1Dark,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: RaisedButton(
                    onPressed: () {
                      if (maxParticipants == 4) {
                        setState(() {
                          maxParticipantsErrorMessage = Text(
                            'Sorry you can\'t have more than four users on a video chat at this time.',
                            textAlign: TextAlign.center,
                            style: kErrorMessage,
                          );
                        });
                      } else {
                        setState(() {
                          maxParticipantsErrorMessage = Container();
                          maxParticipants++; //decrement number of participants
                        });
                      }
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: kBlue,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            maxParticipantsErrorMessage,
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('select number of participants', style: kP1)
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 50),
              child: RaisedButton(
                onPressed: () {
                  testRoomCounter++;
                  testing
                      ? roomDetails['room'] = 'Test Room $testRoomCounter'
                      : null;

                  List _errors = [];
                  roomDetails.forEach((k, v) {
                    if (v == null) {
                      print('$k is null');
                      _errors.add(v);
                    }
                  });
                  if (_errors.isEmpty) {
                    //submit data to database

                    void _createRoom(questions) {
                      generateRoomCode().then((code) {
                        _firestore.collection('rooms').add({
                          'room': roomDetails['room'],
                          'activity': roomDetails['activity'],
                          'participants': roomDetails['participants'],
                          'public': roomDetails['public'],
                          'code': code,
                          'questions': [
                            'question1',
                            'question2',
                            'question3',
                            'question4',
                            'question5',
                            'question6'
                          ],
                        }).then((result) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RoomConfirmation(roomId: code)),
                          );
                          print('result: ${result.documentID}');
                        });
                      });
                    }

                    setRoomQuestions(callback: _createRoom);
                  }
                  ;
                },
                child: Text('Create Room'),
                color: kBlue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
