import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_demo/module/home/view/screen/toDoScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/googleSignIn/authFunction.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 300,
          child: Card(
            color: Colors.blue[100],
            margin:
                const EdgeInsets.only(top: 50, bottom: 50, left: 30, right: 30),
            elevation: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    color: Colors.black54,
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 40.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1542397284385-6010376c5337?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Sign In with Google',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
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
