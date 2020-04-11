import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:socialise/app/lobby.dart';
import 'package:socialise/utilities/constants.dart';

class RoomConfirmation extends StatefulWidget {
  RoomConfirmation({this.roomId});
  final String roomId;
  @override
  _RoomConfirmationState createState() => _RoomConfirmationState();
}

class _RoomConfirmationState extends State<RoomConfirmation> {
  String _roomId;
  @override
  void initState() {
    _roomId = widget.roomId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.green,
                size: 100.0,
                semanticLabel: 'Room Created',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Room Successfully Created',
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                child: Row(children: <Widget>[
                  Text(
                    _roomId,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        ClipboardManager.copyToClipBoard(_roomId)
                            .then((result) {
                          final snackBar = SnackBar(
                            content: Text('Copied to Clipboard'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        });
                      })
                ]),
              ),
              IconButton(
                  icon: Icon(Icons.share), onPressed: () => share(_roomId)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 40.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LobbyPage()),
                      );
                    },
                    child: Icon(Icons.home, color: kBlue, size: 50)),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(Icons.chat_bubble, color: kBlue, size: 50),
              ),
            ],
          )
        ],
      ),
    );
  }

  void share(text) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
