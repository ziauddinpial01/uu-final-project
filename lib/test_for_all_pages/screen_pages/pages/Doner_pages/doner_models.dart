import 'package:cloud_firestore/cloud_firestore.dart';

Future createUserPage(Users users) async {
  final docUsers = FirebaseFirestore.instance.collection('blood-donner-page').doc();
  users.id = docUsers.id;
  final json = users.toJson();
  await docUsers.set(json);
}

class Users {
  String id, name, age, hospitalname, upozila, district, donationdate, bloodgroup;
  int phonenumber;

  Users(
      {this.id = '',
      required this.name,
      required this.district,
      required this.age,
      required this.bloodgroup,
      required this.hospitalname,
      required this.upozila,
      required this.donationdate,
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
        "donationdate": donationdate
      };

  // select of type donner, blood need

  static Users fromJson(Map<String, dynamic> json) => Users(
      name: json['name'],
      district: json['district'],
      age: json['age'],
      bloodgroup: json['bloodgroup'],
      hospitalname: json['hospitalname'],
      phonenumber: json['phonenumber'],
      upozila: json['upozila'],
      donationdate: json['donationdate']
      );
}