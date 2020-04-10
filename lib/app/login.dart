import 'package:flutter/material.dart';
import 'package:socialise/utilities/auth_functions.dart';
import 'package:socialise/utilities/constants.dart';
import 'package:socialise/utilities/error_msg_handling.dart';

import 'package:socialise/app/home.dart';
import 'package:socialise/app/register.dart';

//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode focusUserName;
  FocusNode focusPassword;

  bool showSpinner = false;
  String errorMessageText = '';

  String email;
  String password;

//  final _auth = FirebaseAuth.instance;

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
    print('in login build');
    return Scaffold(
      body: Container(
        color: kBlue,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      Icon(Icons.people, color: Colors.white, size: 45),
//                      Image.asset(
//                        'assets/images/socialise.png',
//                        height: 80,
//                        width: 80,
//                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'SOCIALISE',
                    style: kH1,
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Sign-in with Google',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: GestureDetector(
                onTap: () async {
//                  setState(() {
//                    showSpinner = true;
//                  });
//                  try {
//                    signInWithGoogle(_goToNext).whenComplete(() {
//                      showSpinner = false;
//                    });
//                  } catch (e) {
//                    setState(() {
//                      showSpinner = false;
//                      errorMessageText = errorMessage(e.code);
//                    });
//                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/google_signin.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '-OR-',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
              child: TextFormField(
                focusNode: focusUserName,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(focusPassword);
                },
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(
                  color: kGrey,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
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
                  color: kGrey,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your password',
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 50.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
//                      final user = await _auth.signInWithEmailAndPassword(
//                          email: email, password: password);
//                      setState(() {
//                        showSpinner = false;
//                      });
//                      if (user != null) {
//                        profileCheck(user.user.email, _goToNext);
//                      }
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                        errorMessageText = errorMessage(e.code);
                        print('error: ${e.code}');
                      });
                    }
                  },
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Don\'t have an account?',
                  style: kP1LightGrey,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text('register here',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //TODO refactor this code. Place in auth_functions.dart
  void _goToNext(type) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
//      MaterialPageRoute(builder: (context) => TestPage()),
    );
  }
}
