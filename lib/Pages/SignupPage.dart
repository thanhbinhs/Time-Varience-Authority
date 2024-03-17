import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tva/Authentication/authentication.dart';
import 'package:tva/Components/ReusableWidget.dart';
import 'package:tva/Pages/HomePageWidget.dart';
import 'package:tva/Pages/LoginPage.dart';
import 'package:tva/Pages/ResetPasswordPage.dart';
import 'package:tva/Pages/SignupPage.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:tva/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tva/Services/database_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Signup",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Create an account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Column(
                      children: <Widget>[
                        reusableTextField("Username", CupertinoIcons.person,
                            false, _userName),
                        SizedBox(height: 10),
                        reusableTextField(
                            "Email", Icons.email_outlined, false, _email),
                        SizedBox(height: 10),
                        reusableTextField("Password", CupertinoIcons.padlock,
                            true, _password),
                      ],
                    ),
                  ),
                  firebaseButton(context, "Sign Up", () {
                    try {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email.text, password: _password.text)
                          .then((value) {
                        print("Created New Account");
                        Database().saveUserInformation(_userName.text, _email.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text('Or continue with'),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                          onTap: () => AuthService().signInWithGoogle(),
                          imagePath: 'assets/Images/google.png'),
                      SizedBox(width: 25),
                      SquareTile(
                          onTap: () => AuthService().signInWithApple(),
                          imagePath: 'assets/Images/apple.png')
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already an account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text(
            " Login",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}