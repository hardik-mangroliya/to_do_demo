import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../../core/googleSignIn/authFunction.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializedFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("COMPLETED");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign-in"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 300,
          child: Card(
            color: Colors.blue[100],
            margin:
                const EdgeInsets.only(top: 70, bottom: 70, left: 40, right: 40),
            elevation: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    color: Colors.black54,
                    elevation: 10,
                    child: const Text(
                      'Sign In with Google',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => signInWithGoogle(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
