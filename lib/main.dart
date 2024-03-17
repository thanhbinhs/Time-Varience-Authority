import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:tva/Pages/AuthPage.dart';
import 'package:tva/Pages/LoginPage.dart';
import 'package:tva/Widgets/Routine/ListTaskWidget/ListTaskWidget.dart';
import 'package:tva/Widgets/Routine/ListTaskWidget/MainTaskWidget.dart';
import 'Pages/HomePageWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // make sure firebase is initialized before we run our application
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value){
  });
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F3),
      ),
      home: HomePage(),
      // routes: {
      //   "/" : (context) => AuthPage(),
      //   // "/home": (context) => HomePage(),
      // },
    );
  }
}