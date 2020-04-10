import 'package:flutter/material.dart';

import 'package:socialise/app/chat_room.dart';
import 'package:socialise/utilities/constants.dart';

class ChatRoomTile extends StatelessWidget {
  ChatRoomTile({@required this.tileHeight, @required this.tileWidth});

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
                  'Jeremiah\'s Room',
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
                      MaterialPageRoute(builder: (context) => ChatRoomPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      height: tileHeight,
      width: tileWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(3, 3))],
        color: Colors.white,
      ),
    );
  }
}
