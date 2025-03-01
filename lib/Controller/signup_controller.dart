import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pages/bottomnav.dart';

class SignupController {
  static Future<void> createAccount({
    required context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 15.0),
          ))));
   

      var userId = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;
      Map<String, dynamic> data = {
        "name": name,
        "email": email,
        "id": userId.toString()
      };
    
      try {
        await db.collection("users").doc(userId.toString()).set(data);
      } catch (e) {
        print(e);
      }

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const Bottomnav();
      }), (route) {
        return false;
      });
    }  on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 15.0),
              ))));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account is Already exsists",
                style: TextStyle(fontSize: 15.0),
              ))));
        }
      }
  }
}
