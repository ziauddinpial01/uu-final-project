
import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model_page {
  final String? id;
  final String? username;
  final String? email;
  final String? password;
  final String? age;
  final String? location;
  

  User_Model_page({this.location, this.username, this.age, this.id, this.email, this.password});

  factory User_Model_page.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User_Model_page(
      username: snapshot['username'],
      age: snapshot['age'],
      id: snapshot['id'],
      email: snapshot['email'],
      password: snapshot['password'],
      location: snapshot['location'],
    );
  }
  

  Map<String, dynamic> tojson() => {
    "username": username,
    "age": age,
    "id": id,
    "email": email,
    "password": password,
    "location": location,
  };
}