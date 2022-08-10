import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../core/googleSignIn/authFunction.dart';
import 'loginScreen.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ToDo Demo'),
      ),
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      documentSnapshot['name'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                    ),
                    subtitle: Text(documentSnapshot['price'].toString()),
                    trailing: SizedBox(
                      width: 96,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () => createOrUpdate(
                                documentSnapshot: documentSnapshot,
                                sheetContext: context),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () =>
                                deleteProduct(documentSnapshot.id, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30, bottom: 15),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () => createOrUpdate(sheetContext: context),
              backgroundColor: Colors.teal[100],
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 230),
            InkWell(
              onTap: () {
                signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                height: 55,
                width: 90,
                decoration: BoxDecoration(
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
      ),
    );
  }
}
