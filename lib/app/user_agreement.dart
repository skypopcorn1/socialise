import 'package:flutter/material.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:socialise/app/home.dart';

import 'package:socialise/utilities/auth_functions.dart';
import 'package:socialise/utilities/constants.dart';

class UserAgreementPage extends StatefulWidget {
  UserAgreementPage({this.userEmail});

  final userEmail;

  @override
  _UserAgreementPageState createState() => _UserAgreementPageState();
}

class _UserAgreementPageState extends State<UserAgreementPage> {
  String userEmail;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    userEmail = widget.userEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.asset('assets/images/cockatoo.png', width: 50.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                'End User Agreement',
                style: kTitle,
              ),
            ),
          ),
          Container(
            width: 50,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 30.0),
            child: Text(
              kUserAgreementBody,
              softWrap: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 28.0),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  showSpinner = true;
                });
                //TODO Complete registration (make profile as TCs accepted with Timestamp, send to CustomerMapPage
                try {
                  userAgreementAcceptance(userEmail).then((result) {
                    if (result) {
                      print('result: $result');
                      showSpinner = false;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    }
                  });
                } catch (error) {
                  print('error: $error');
                }
              },
              color: kBlue,
              child: Text(
                'Accept',
                style: kH2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
