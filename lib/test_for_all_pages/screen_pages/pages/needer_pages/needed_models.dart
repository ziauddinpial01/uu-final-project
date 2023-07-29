
import 'package:cloud_firestore/cloud_firestore.dart';

Future neededUserPage(Users_page user) async {
  final docUser = FirebaseFirestore.instance.collection('blood-needed-page').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

class Users_page {
  String id, name, age, hospitalname, upozila, district, bloodgroup;
  int phonenumber;

  Users_page(
      {this.id = '',
      required this.name,
      required this.district,
      required this.age,
      required this.bloodgroup,
      required this.hospitalname,
      required this.upozila,
      required this.phonenumber});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'district': district,
        'age': age,
        'bloodgroup': bloodgroup,        
        "hospitalname": hospitalname,
        'phonenumber': phonenumber,
        'upozila': upozila,
      };

  // select of type donner, blood need

  static Users_page fromJson(Map<String, dynamic> json) => Users_page(
      name: json['name'],
      district: json['district'],
      age: json['age'],
      bloodgroup: json['bloodgroup'],
      hospitalname: json['hospitalname'],
      phonenumber: json['phonenumber'],
      upozila: json['upozila'],
      );
}