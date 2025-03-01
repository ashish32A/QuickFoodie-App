import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickfoodie/pages/bottomnav.dart';


class LoginController {
  static Future<void> Login(
      {required context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const Bottomnav();
      }), (route) {
        return false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            content: Text(
          "No user Found for that Email ",
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ))));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            content: Text(
          "Wrong Password Provided by User",
          style: TextStyle(fontSize: 15.0),
        ))));
      }
    }
  }
}
