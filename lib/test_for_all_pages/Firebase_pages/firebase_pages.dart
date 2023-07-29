

import 'package:blood_app/test_for_all_pages/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelperPage {

  static Future update(UserModel user) async {
  final userCollection = FirebaseFirestore.instance.collection('users');

  final docRef = userCollection.doc(user.id);

  final newUser = UserModel(
    id: user.id,
    username: user.username,
    age: user.age,
    email: user.email,
    password: user.password
  ).tojson();

  try {
    await docRef.update(newUser);
  } catch (e) {
    print('Some error occured $e');
  }

}
}


Future SignUpModel(Users_login user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

class Users_login {
  String id, name, email, password, location;
  int phonenumber;

  Users_login(
      {this.id = '',
      required this.name,
      required this.email,
      required this.location,
      required this.password,
      required this.phonenumber});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'location': location,
        'password': password,        
        'phonenumber': phonenumber,
      };

  // select of type donner, blood need

  static Users_login fromJson(Map<String, dynamic> json) => Users_login(
      name: json['name'],
      email: json['email'],
      location: json['location'],
      password: json['password'],
      phonenumber: json['phonenumber'],
      );
}