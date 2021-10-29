// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:bkautomobiles/Home/homepage.dart';
import 'package:bkautomobiles/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _currentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 45),
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 150,
            ),
            Form(
                key: _currentKey,
                child: Container(
                  height: 290,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 15, right: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your Email",
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.red,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            )),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Cannot be empty";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your Password",
                            icon: Icon(Icons.lock_outline, color: Colors.red),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Cannot be empty";
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () async {
                            {
                              final form = _currentKey.currentState;
                              if (form!.validate()) {
                                var email = emailController.text;
                                var password = passwordController.text;
                                //Circular Progress Bar
                                showLoaderDialog(context);

                                //API Calling

                                var rsp = await logInUser(email, password);
                                print(rsp);
                                try {
                                  if (rsp["success"] == 1) {
                                    Navigator.pop(context);
                                    showFlutterToast("Login Successfull",
                                        Colors.lightGreen, ToastGravity.BOTTOM);
                                    // navigation
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return MainPage();
                                    }));

                                    //Failed, user existed
                                  } else if (rsp["failed"] == 1) {
                                    Navigator.pop(context);
                                    showFlutterToast("Invalid Credentials",
                                        Colors.red, ToastGravity.BOTTOM);
                                  } else {
                                    // no user found
                                    Navigator.pop(context);
                                    showFlutterToast(
                                        "No User Found/Login Failed",
                                        Colors.red,
                                        ToastGravity.BOTTOM);
                                  }
                                } on SocketException {
                                  // exception
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('No internet Connection')),
                                    );
                                  });
                                  Navigator.pop(context);
                                }
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: Text("Sign In"),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
