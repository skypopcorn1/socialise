//import 'dart:async';
//import 'dart:core';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialise/components/school_of_life_bloc.dart';

import 'package:socialise/utilities/constants.dart';

//import 'package:flutter_webrtc/webrtc.dart';

class ChatRoomPage extends StatefulWidget {
  ChatRoomPage({
    this.room,
    this.user,
  });

  final DocumentSnapshot room;
  final Future<FirebaseUser> user;

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final Firestore _firestore = Firestore.instance;
//
//  MediaStream _localStream;
//  RTCPeerConnection _peerConnection;
//  final _localRenderer = new RTCVideoRenderer();
//  final _remoteRenderer = new RTCVideoRenderer();
  bool _inCalling = false;
//  Timer _timer;

//  initRenderers() async {
//    await _localRenderer.initialize();
//    await _remoteRenderer.initialize();
//  }
//
//  _onAddStream(MediaStream stream) {
//    print('addStream: ' + stream.id);
//    _remoteRenderer.srcObject = stream;
//  }
//
//  _onRemoveStream(MediaStream stream) {
//    _remoteRenderer.srcObject = null;
//  }
//
//  _onCandidate(RTCIceCandidate candidate) {
//    print('onCandidate: ' + candidate.candidate);
//    _peerConnection.addCandidate(candidate);
//  }
//
//  _hangUp() async {
//    try {
//      await _localStream.dispose();
//      await _peerConnection.close();
//      _peerConnection = null;
//      _localRenderer.srcObject = null;
//      _remoteRenderer.srcObject = null;
//    } catch (e) {
//      print(e.toString());
//    }
//    setState(() {
//      _inCalling = false;
//    });
//  }
//
//  // Platform messages are asynchronous, so we initialize in an async method.
//  _makeCall() async {
//    final Map<String, dynamic> mediaConstraints = {
//      "audio": true,
//      "video": {
//        "mandatory": {
//          "minWidth":
//              '640', // Provide your own width, height and frame rate here
//          "minHeight": '480',
//          "minFrameRate": '30',
//        },
//        "facingMode": "user",
//        "optional": [],
//      }
//    };
//
//    Map<String, dynamic> configuration = {
//      "iceServers": [
//        {"url": "stun:stun.l.google.com:19302"},
//      ]
//    };
//
//    final Map<String, dynamic> offer_sdp_constraints = {
//      "mandatory": {
//        "OfferToReceiveAudio": true,
//        "OfferToReceiveVideo": true,
//      },
//      "optional": [],
//    };
//
//    final Map<String, dynamic> loopback_constraints = {
//      "mandatory": {},
//      "optional": [
//        {"DtlsSrtpKeyAgreement": false},
//      ],
//    };
//
//    if (_peerConnection != null) return;
//
//    try {
//      _localStream = await navigator.getUserMedia(mediaConstraints);
//      _localRenderer.srcObject = _localStream;
//
//      _peerConnection =
//          await createPeerConnection(configuration, loopback_constraints);
//
////      _peerConnection.onSignalingState = _onSignalingState;
////      _peerConnection.onIceGatheringState = _onIceGatheringState;
////      _peerConnection.onIceConnectionState = _onIceConnectionState;
////      _peerConnection.onRenegotiationNeeded = _onRenegotiationNeeded;
//      _peerConnection.onAddStream = _onAddStream;
//      _peerConnection.onRemoveStream = _onRemoveStream;
//      _peerConnection.onIceCandidate = _onCandidate;
//
//      _peerConnection.addStream(_localStream);
//      RTCSessionDescription description =
//          await _peerConnection.createOffer(offer_sdp_constraints);
//      print(description.sdp);
//      _peerConnection.setLocalDescription(description);
//      //change for loopback.
//      description.type = 'answer';
//      _peerConnection.setRemoteDescription(description);
//
//      _localStream.getAudioTracks()[0].setMicrophoneMute(false);
//    } catch (e) {
//      print(e.toString());
//    }
//    if (!mounted) return;
//
////    _timer = new Timer.periodic(Duration(seconds: 1), handleStatsReport);
//
//    setState(() {
//      _inCalling = true;
//    });
//  }

//
//  @override
//  deactivate() {
//    super.deactivate();
//    if (_inCalling) {
//      _hangUp();
//    }
//    _localRenderer.dispose();
//    _remoteRenderer.dispose();
//  }

  var user;
  bool testing = true;
  List _questionSet;
  Widget _questionListView = Container(); //initialise with an empty container

  @override
  initState() {
    user = widget.user;
    print('widget.room[questions]: ${widget.room['questions']}');
    _questionListView = QuestionListView(room: widget.room, user: user);
    super.initState();
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
              child: QuestionListView(
                room: widget.room,
              ),
            ),
          ),
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
