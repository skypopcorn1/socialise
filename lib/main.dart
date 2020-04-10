import 'package:flutter/material.dart';
import 'package:socialise/app/home.dart';
import 'package:socialise/app/login.dart';

import 'package:socialise/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socialise',
      theme: ThemeData(
        primarySwatch: kBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
