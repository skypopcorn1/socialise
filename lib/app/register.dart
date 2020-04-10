import 'package:flutter/material.dart';
import 'package:socialise/app/login.dart';
import 'package:socialise/app/user_agreement.dart';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:socialise/utilities/auth_functions.dart';
import 'package:socialise/utilities/constants.dart';
import 'package:socialise/utilities/error_msg_handling.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode focusUserName;
  FocusNode focusPassword;

  String email;
  String password;
  bool showSpinner = false;
  String errorMessageText = '';

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    focusUserName = FocusNode();
    focusPassword = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusUserName.dispose();
    focusPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/images/socialise.png',
              width: 50.0,
            )),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Register with Google',
                style: TextStyle(color: kGrey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () async {
//                setState(() {
//                  showSpinner = true;
//                });
//                try {
//                  signInWithGoogle(_goToNext).whenComplete(() {
//                    showSpinner = false;
//                  });
//                } catch (e) {
//                  setState(() {
//                    showSpinner = false;
//                    errorMessageText = errorMessage(e.code);
//                  });
//                }
              },
              child: Image.asset(
                'assets/images/google_signin.png',
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.0,
              top: 25.0,
            ),
            child: Text(
              errorMessageText,
              style: kErrorMessage,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.0,
              top: 10.0,
              bottom: 18.0,
            ),
            child: Text('Register with email:'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              focusNode: focusUserName,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(focusPassword);
              },
              onChanged: (value) {
                email = value;
              },
              style: TextStyle(
                color: kLightGrey,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: kLightGrey,
                ),
                labelText: 'Enter your email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              focusNode: focusPassword,
              onChanged: (value) {
                password = value;
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).dispose();
              },
              obscureText: true,
              style: TextStyle(
                color: kLightGrey,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: kLightGrey,
                ),
                labelText: 'Enter your password',
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10.0, 40.0, 15.0),
                child: RaisedButton(
                  color: kLinkGreen,
                  child: Text(
                    'register',
                    style: TextStyle(
                      color: kGrey,
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final registeredUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (registeredUser != null) {
                        profileCheck(registeredUser.user.email, _goToNext);
                        showSpinner = false;
                      }
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                        errorMessageText = errorMessage(e.code);
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Center(child: Text('Already have a login?')),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Center(
                child: Text(
              'login',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            )),
          ),
        ],
      ),
    );
  }

  void _goToNext(userEmail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserAgreementPage(userEmail: userEmail),
      ),
    );
  }
}
