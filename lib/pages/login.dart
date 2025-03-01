// ignore_for_file: body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickfoodie/Controller/login_controller.dart';
import 'package:quickfoodie/pages/bottomnav.dart';
import 'package:quickfoodie/pages/passwordforgot.dart';
import 'package:quickfoodie/pages/signup.dart';
import 'package:quickfoodie/widgets/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obsecureText = true;
  final formKey = GlobalKey<FormState>();
  String email = "", password = "";

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isloading = false;
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Bottomnav()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFff5c30), Color(0xFFe74b1a)])),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 40.0),
                              Text(
                                "Login ",
                                style: AppWidget.headlineTextFeildStyle(),
                              ),
                              const SizedBox(height: 40.0),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter  Email';
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle:
                                        AppWidget.semiboldTextFeildStyle(),
                                    prefixIcon:
                                        const Icon(Icons.email_outlined)),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: obsecureText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter  Password';
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: AppWidget.semiboldTextFeildStyle(),
                                  prefixIcon:
                                      const Icon(Icons.password_outlined),
                                  suffixIcon: IconButton(
                                    icon: Icon(obsecureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        obsecureText = !obsecureText;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Passwordforgot()),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: AppWidget.semiboldTextFeildStyle(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              GestureDetector(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    isloading = true;
                                    setState(() {});
                                    await LoginController.Login(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text);
                                    isloading = false;
                                  }
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: const Color(0Xffff5722),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: isloading
                                          ? const CircularProgressIndicator()
                                          : const Text("LOGIN",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: AppWidget.semiboldTextFeildStyle()),
                        const SizedBox(width: 5.0),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            },
                            child: Text("Sign up",
                                style: AppWidget.boldTextFeildStyle())),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
