
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/widgets.dart';

// FirebaseFirestore firestore = FirebaseFirestore.instance;

// FirebaseApp secondaryApp = Firebase.app('SecondaryApp');

// FirebaseFirestore firestorre = FirebaseFirestore.instanceFor(app: secondaryApp);
// class AddUser extends StatelessWidget{
//   final String name;

//   AddUser(this.name);

//   @override
//   Widget build(BuildContext context){
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     Future<void>addUser (){
//       return users.add({'name':name}).then((value)=>print("User Added")).catchError((error)=>print("Failed to Add user"));
//     }

//   }
// }