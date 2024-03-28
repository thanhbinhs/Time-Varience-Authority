import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;

  UserModel({this.id, this.name, this.email, this.password});

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot['id'];
    name = documentSnapshot['user_name'];
    email = documentSnapshot['email'];
    password = documentSnapshot['password'];
  }
}
