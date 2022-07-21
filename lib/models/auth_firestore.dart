import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/Components/user_class.dart';
import 'package:firebaseapp/screens/Home.dart';
import 'package:flutter/material.dart';
class AuthFireStore {
  final db = FirebaseFirestore.instance;

  Future createAccount(Users users) async {
    final docs = db.collection('user').doc();
    final us = Users(
      id : docs.id,
      name : users.name,
      username : users.username,
      password : users.password,
    );
    final json = us.toJson();
    await docs.set(json);
  }

  Future logIn(String username, String password, BuildContext context) async {
    FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
          if (doc['username'] == username && doc['password'] == password) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()
            ));
            HomePage.setCurrentID(doc['id']);
          }
        }
      }
    );
  }
}