import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../module/home/view/screen/toDoScreen.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signInWithGoogle(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;
    if (result != null) {
      Navigator?.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ToDoScreen(
            user: result.user,
          ),
        ),
      );
    }
  }
}

Future<void> SignOut() async {
  await FirebaseAuth.instance.signOut();
  if (await GoogleSignIn().isSignedIn()) {
    await GoogleSignIn().signOut().then(
          (value) => print("Your Sign-Out!!!"),
        );
  }
}
