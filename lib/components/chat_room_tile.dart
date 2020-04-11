import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:socialise/app/chat_room.dart';
import 'package:socialise/utilities/constants.dart';

final Firestore _firestore = Firestore.instance;

class ChatRoomListView extends StatelessWidget {
  ChatRoomListView({
    @required this.tileHeight,
    @required this.tileWidth,
    @required this.public,
  });

  final bool public;
  final double tileHeight;
  final double tileWidth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('rooms')
          .where('public', isEqualTo: public)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('no data');
          return Text('No Rooms Available');
        }

        List<Widget> _roomTiles = [];
        for (var doc in snapshot.data.documents) {
          _roomTiles.add(
            ChatRoomTile(
              doc: doc,
              tileHeight: tileHeight,
              tileWidth: tileWidth,
            ),
          );
        }
        return ListView(children: _roomTiles);
      },
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  ChatRoomTile({@required this.doc, this.tileHeight, this.tileWidth});

  DocumentSnapshot doc;
  double tileHeight;
  double tileWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  doc.data['room'],
                  style: kH3Bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(18.0),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/profile.png',
                    height: 100,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: kBlue,
                  elevation: 5,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: kBlue),
                  ),
                  child: Text('Join'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatRoomPage(
                                room: doc,
                              )),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.all(10.0),
      height: tileHeight,
      width: tileWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 3)
        ],
        color: Colors.white,
      ),
    );
  }
}
