// ignore_for_file: unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickfoodie/Controller/signup_controller.dart';
import 'package:quickfoodie/pages/bottomnav.dart';
import 'package:quickfoodie/pages/login.dart';
import 'package:quickfoodie/pages/passwordforgot.dart';
import 'package:quickfoodie/widgets/widget_support.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool obsecureText = true;
  final formKey = GlobalKey<FormState>();
  String email = "", name = "", password = "";
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isloading = false;

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 15.0),
            ))));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Bottomnav()));
      } on FirebaseException catch (e) {
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
                        height: MediaQuery.of(context).size.height / 1.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                "Sign up ",
                                style: AppWidget.headlineTextFeildStyle(),
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Name';
                                  }
                                },
                                controller: nameController,
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle:
                                        AppWidget.semiboldTextFeildStyle(),
                                    prefixIcon:
                                        const Icon(Icons.person_outlined)),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Email';
                                  }
                                },
                                controller: emailController,
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
                                    return 'Please enter your Password';
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
                              InkWell(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    isloading = true;
                                    setState(() {});
                                    await SignupController.createAccount(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                    );
                                    isloading = false;
                                    setState(() {});
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
                                    child:  Center(
                                      child:  isloading
                                    ? const CircularProgressIndicator()
                                    :  const Text("SIGN UP",
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
                        Text("Already have an account?",
                            style: AppWidget.semiboldTextFeildStyle()),
                        const SizedBox(width: 5.0),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: Text("Login",
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
