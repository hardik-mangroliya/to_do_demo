import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/googleSignIn/authFunction.dart';
import 'loginScreen.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key, User? user}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: TextFormField(
                      controller: textEditingController,
                    ),
                  ),
                ),
                InkWell(onTap: () {}, child: const Icon(Icons.edit)),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(onTap: () {}, child: const Icon(Icons.delete)),
                ),
              ],
            ),
            // Container(
            //   width: 390,
            //   height: 50,
            //   color: Colors.amber,
            //   child: Row(
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.only(left: 10),
            //         child: Text("ADD TITLE HERE"),
            //       ),
            //       const SizedBox(width: 200),
            //       InkWell(onTap: () {}, child: const Icon(Icons.edit)),
            //       const SizedBox(width: 10),
            //       const Icon(Icons.delete)
            //     ],
            //   ),
            // ),
            const SizedBox(height: 10),
            Container(
              width: 390,
              height: 50,
              color: Colors.amber,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("ADD TITLE HERE"),
                  ),
                  const SizedBox(width: 200),
                  InkWell(onTap: () {}, child: const Icon(Icons.edit)),
                  const SizedBox(width: 10),
                  const Icon(Icons.delete)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 15,
                      child: Container(
                        height: 250,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: textEditingController,
                                decoration: const InputDecoration(
                                    hintText: "ADD TITLE"),
                              ),
                              const SizedBox(height: 137),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 220, bottom: 10),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 90,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Text(
                                        "SAVE",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              backgroundColor: Colors.teal[100],
            ),
          ),
          const SizedBox(
            width: 200,
          ),
          InkWell(
            onTap: () {
              SignOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Container(
              height: 45,
              width: 90,
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Colors.teal[100]),
              child: const Center(
                child: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
