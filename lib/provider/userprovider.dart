import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Userprovider extends ChangeNotifier {
  String userName = "";
  String userEmail = "";
  String userId = "";

  var db = FirebaseFirestore.instance;
  void getUserDetails() {
      var authUser = FirebaseAuth.instance.currentUser;

    db.collection("users").doc(authUser!.uid).get().then((dataSnapshot) {
      userName = dataSnapshot.data()?["name"] ?? "";
      userEmail = dataSnapshot.data()?["email"] ?? "";
      userId = dataSnapshot.data()?["id"] ?? "";
      notifyListeners();
    });
  }
}
