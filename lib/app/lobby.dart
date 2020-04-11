import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:socialise/components/chat_room_tile.dart';
import 'package:socialise/app/create_room.dart';
import 'package:socialise/app/test_room.dart';

import 'package:socialise/utilities/constants.dart';

final Firestore _firestore = Firestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage>
    with SingleTickerProviderStateMixin {
  String _roomId;
  var user;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Private'),
    Tab(text: 'Public'),
  ];

  TabController _tabController;

  void getUser() async {
    final _user = await _auth.currentUser();
    setState(() {
      user = _user;
    });
  }

  @override
  void initState() {
    user = _auth.currentUser();
    print('tablist.length: ${myTabs.length}');
    _tabController = TabController(
      vsync: this,
      length: myTabs.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double outerMargin = MediaQuery.of(context).size.width * 0.025;
    double tileHeight = MediaQuery.of(context).size.height * 0.25;
    double tileWidth = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/socialise.png',
                height: 40,
              ),
              Text('  SOCIALISE'),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: outerMargin * 2, left: outerMargin, bottom: outerMargin),
              child: Text(
                'Lobby',
                style: kH1Dark,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(outerMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateRoomPage()),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: outerMargin * 20,
                      margin: EdgeInsets.all(outerMargin),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green[400],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Create Room',
                              style: kP1White,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: outerMargin * 2, horizontal: outerMargin),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 40,
                            width: outerMargin * 20,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onFieldSubmitted: (value) {},
                              onChanged: (value) {
                                _roomId = value;
                                print('roomId: $_roomId');
                              },
                              style: kH4,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Enter room id',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatRoomTestPage()),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                margin: EdgeInsets.only(left: outerMargin),
                                width: outerMargin * 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: kBlue,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Join Room',
                                        style: kP1White,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                            color: Theme.of(context).primaryColor),
                        child: new TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.blue[100],
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 6,
                            tabs: myTabs),
                        margin: EdgeInsets.symmetric(horizontal: outerMargin),
                      ),
                      Container(
                        height: tileHeight * 2,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            ChatRoomListView(
                              tileHeight: tileHeight,
                              tileWidth: tileWidth,
                              public: false,
                            ),
                            ChatRoomListView(
                              tileHeight: tileHeight,
                              tileWidth: tileWidth,
                              public: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _getPage(Tab tab, double width, double height) {
  switch (tab.text) {
    case 'Private':
      return Text('Private Rooms');
    case 'Public':
      return Text('Public Rooms');
  }
}
