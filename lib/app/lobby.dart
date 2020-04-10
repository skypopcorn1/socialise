import 'package:flutter/material.dart';

import 'package:socialise/components/chat_room_tile.dart';
import 'package:socialise/app/create_room.dart';

import 'package:socialise/utilities/constants.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  Widget build(BuildContext context) {
    double outerMargin = MediaQuery.of(context).size.width * 0.025;
    double tileHeight = MediaQuery.of(context).size.height * 0.25;
    double tileWidth = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
        appBar: AppBar(
          title: Text('SOCIALISE'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(outerMargin),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateRoomPage()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle,
                            color: kBlue,
                            size: 45,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Create a Room',
                              style: kH2Dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ChatRoomTile(
                    tileHeight: tileHeight,
                    tileWidth: tileWidth,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
