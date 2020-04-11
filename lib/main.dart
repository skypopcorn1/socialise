import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:socialise/app/test_room.dart';

import 'package:socialise/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String server = '';

  SharedPreferences _prefs;

  _initData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      server = _prefs.getString('server') ?? 'webrtc.socialise.rocks';
    });
  }

  @override
  initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socialise',
      theme: ThemeData(
        primarySwatch: kBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoopBackSample(),
    );
  }
}
