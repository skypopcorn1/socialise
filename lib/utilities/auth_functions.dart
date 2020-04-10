//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//final _firestore = Firestore.instance;
//final FirebaseAuth _auth = FirebaseAuth.instance;
//final GoogleSignIn googleSignIn = GoogleSignIn();

void profileCheck(email, callback) async {
  //TODO provide email as parameter rather than authResult.
//  if (googleSignIn ??= false) {
//    authResult = authResult.email;
//  } else {
//    authResult = authResult.user.email;
//  }

  print("authResult (profilecheck): $email");

//  final result = await _firestore
//      .collection('profiles')
//      .where('user', isEqualTo: email)
//      .getDocuments();

//  if (result.documents.isNotEmpty) {
//    //user is already registered
//    if (result.documents.length == 1) {
//      for (var doc in result.documents) {
//        String _type = doc.data['type'];
//        callback(_type);
//      }
//    } else {
//      //TODO handle error where user has multiple profiles.
//      print('error: more than one registration');
//    }
//    //TODO if coming from registration, handle case where user is already registered.
//  } else {
//    //TODO if coming from registration, add their profile.
//    callback(email);
//  }
}

Future userAgreementAcceptance(userEmail) async {
  //TODO check first if user profile already exists.
  print('auth_agreement: $userEmail');
//  var result = await _firestore.collection('profiles').add({
//    'user': userEmail,
//    'accepted_user_agreement': DateTime.now(),
//  });
//  if (result != null) {
//    print('result: $result');
//    return true;
//  }
//  return false;
}

Future<String> signInWithGoogle(callback) async {
//  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//  final GoogleSignInAuthentication googleSignInAuthentication =
//      await googleSignInAccount.authentication;

//  final AuthCredential credential = GoogleAuthProvider.getCredential(
//    accessToken: googleSignInAuthentication.accessToken,
//    idToken: googleSignInAuthentication.idToken,
//  );

  print('here.');
//  final AuthResult authResult = await _auth.signInWithCredential(credential);
//  final FirebaseUser user = authResult.user;
//  print('here..');
//  assert(!user.isAnonymous);
//  assert(await user.getIdToken() != null);
//  print('here...');
//  final FirebaseUser currentUser = await _auth.currentUser();
//  assert(user.uid == currentUser.uid);
//
//  profileCheck(user.email, callback); //true indicates a google signin
//
//  return 'User: $user';
}

void signOutGoogle() async {
//  await googleSignIn.signOut();

  print("User Sign Out");
}
