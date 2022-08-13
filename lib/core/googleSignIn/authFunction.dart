import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_demo/prefrences.dart';
import '../../module/home/view/screen/toDoScreen.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class authFunction {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    String userEmail = (FirebaseAuth.instance.currentUser!).email ?? '';
    var userTodo = FirebaseFirestore.instance
        .collection('products')
        .where("email", isEqualTo: userEmail)
        .snapshots();
    return userTodo;
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  Future<void> createOrUpdate(
      {DocumentSnapshot? documentSnapshot,
      required BuildContext sheetContext}) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['name'].toString();
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: sheetContext,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(action == 'create' ? 'Create' : 'Update'),
                onPressed: () async {
                  final String name = _nameController.text;
                  final double? price = double.tryParse(_priceController.text);
                  if (name != null && price != null) {
                    if (action == 'create') {
                      await _products.add({
                        "name": name,
                        "price": price,
                        "email": FirebaseAuth.instance.currentUser?.email ?? ''
                      });
                    }

                    if (action == 'update') {
                      await _products
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "price": price});
                    }
                    _nameController.text = '';
                    _priceController.text = '';
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> deleteProduct(String productId, BuildContext context) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 100),
        content: Text("Item Deleted Successfully!!"),
      ),
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        await MyPrefenrces.setUserLoggedIn();
        Navigator?.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ToDoScreen(),
          ),
        );
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await MyPrefenrces.clearData();
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    }
  }
}
