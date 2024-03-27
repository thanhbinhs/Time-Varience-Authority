import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:tva/Controllers/userController.dart';
// import 'package:tva/Models/user.dart';
import 'package:get/get.dart';
// import 'package:tva/Services/database_service.dart';

class AuthController extends GetxController{
  // FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User>? _firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // Rx<UserModel> _userModel = UserModel().obs;
  Rx<int> axisCount = 2.obs;

  User get user => _firebaseUser!.value;
}