
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? age;
  final String? email;
  final String? password;
  

  UserModel({this.username, this.age, this.id, this.email, this.password});

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot['username'],
      age: snapshot['age'],
      id: snapshot['id'],
      email: snapshot['email'],
      password: snapshot['password'],
    );
  }
  

  Map<String, dynamic> tojson() => {
    "username": username,
    "age": age,
    "id": id,
    "email": email,
    "password": password,
  };
}