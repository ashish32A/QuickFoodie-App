import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickfoodie/pages/onboard.dart';

import '../widgets/widget_support.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Profile",
                    style: AppWidget.headlineTextFeildStyle(),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 500.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 40.0),
                  child: Center(
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return const Onboard();
                            }), (route) {
                              return false;
                            });
                          },
                          child: const Text("Logout",
                              style: TextStyle(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'))),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
