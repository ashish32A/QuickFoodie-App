import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickfoodie/pages/signup.dart';

class Passwordforgot extends StatefulWidget {
  const Passwordforgot({super.key});

  @override
  State<Passwordforgot> createState() => _PasswordforgotState();
}

class _PasswordforgotState extends State<Passwordforgot> {
  TextEditingController mailController = new TextEditingController();
  String email = "";
  final formkey = GlobalKey<FormState>();
  resetPassword() async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Password Reset Email has been sent !",
        style: TextStyle(fontSize: 18.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "No user found for that email.",
          style: TextStyle(fontSize: 18.0),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Container(
              child: const Text("Password Recovery",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Enter your mail ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ListView(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white70, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextFormField(
                              controller: mailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your mail';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white70,
                                    size: 30.0,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 40.0),
                          InkWell(
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                setState(() {
                                  email = mailController.text;
                                });
                                await resetPassword();
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 60.0, right: 60.0),
                              child: Container(
                                width: 140,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Send Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have  an account?",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: const Text(
                                    "Create",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(225, 184, 166, 6)),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
