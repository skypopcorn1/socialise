import 'package:flutter/material.dart';

import 'package:socialise/components/chat_room_tile.dart';
import 'package:socialise/app/create_room.dart';
import 'package:socialise/app/test_room.dart';

import 'package:socialise/utilities/constants.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage>
    with SingleTickerProviderStateMixin {
  String _roomId;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Private'),
    Tab(text: 'Public'),
  ];

  TabController _tabController;

  @override
  void initState() {
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
              padding: EdgeInsets.all(outerMargin),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: GestureDetector(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onFieldSubmitted: (value) {},
                              onChanged: (value) {
                                _roomId = value;
                                print('roomId: $_roomId');
                              },
                              style: kH3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Enter a room code',
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
                                      Icons.add,
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
                        margin: EdgeInsets.all(outerMargin),
                      ),
                      Container(
                        height: tileHeight / 3,
                        child: TabBarView(
                          controller: _tabController,
                          children: myTabs.map((Tab tab) {
                            final String label = tab.text.toLowerCase();
                            return Center(
                              child: Text(
                                '$label',
                                style: kH3Bold,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
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

Widget _getPage(Tab tab) {
  switch (tab.text) {
    case 'Private':
      return Text('Private');
    case 'Public':
      return Text('Public');
  }
}

class DecoratedTabBar extends StatelessWidget {
  DecoratedTabBar({@required this.tabBar, @required this.decoration});

  final TabBarView tabBar;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        tabBar,
        Positioned.fill(child: Container(decoration: decoration)),
      ],
    );
  }
}
