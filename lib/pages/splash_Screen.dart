import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:quickfoodie/pages/bottomnav.dart';

import 'package:quickfoodie/pages/onboard.dart';

import '../provider/userprovider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    //check  user login status
    Future.delayed(const Duration(seconds: 3), () {
      if (user == null) {
        openLogin();
      } else {
        openDashboard();
      }
    });

    super.initState();
  }

  void openDashboard() {
    Provider.of<Userprovider>(context, listen: false).getUserDetails();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const Bottomnav();
    }));
  }

  void openLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const Onboard();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Image.asset("assets/images/splash.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
