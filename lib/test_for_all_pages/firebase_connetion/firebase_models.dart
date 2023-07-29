
import 'package:cloud_firestore/cloud_firestore.dart';

class UserLoginModel {
  final String? id;
  final String? username;
  final String? Phonenumber;
  final String? email;
  final String? password;
  final String? location;
  

  UserLoginModel({this.Phonenumber, this.location, this.username, this.id, this.email, this.password});

  factory UserLoginModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserLoginModel(
      username: snapshot['username'],
      Phonenumber: snapshot['Phonenumber'],
      id: snapshot['id'],
      email: snapshot['email'],
      password: snapshot['password'],
      location: snapshot['location'],
    );
  }
  

  Map<String, dynamic> tojson() => {
    "username": username,
    "Phonenumber": Phonenumber,
    "id": id,
    "email": email,
    "password": password,
    "location": location,
  };
}