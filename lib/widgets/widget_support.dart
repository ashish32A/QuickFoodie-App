import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle headlineTextFeildStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle lightTextFeildStyle() {
    return const TextStyle(
        color: Colors.black38,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }

  static TextStyle semiboldTextFeildStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }
}
