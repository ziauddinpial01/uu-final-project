
import 'package:cloud_firestore/cloud_firestore.dart';

Future userprofilepage(Profile_page profile_page) async {
  final docUser = FirebaseFirestore.instance.collection('profile_page').doc();
  profile_page.id = docUser.id;
  final json = profile_page.toJson();
  await docUser.set(json);
}

class Profile_page {
  String id, username, bloodgroup, email, village, upozila, district;
  String age, phonenumber;
  Profile_page({
    this.id = '', 
    required this.username, 
    required this.bloodgroup, 
    required this.age, 
    required this.email, 
    required this.phonenumber, 
    required this.village, 
    required this.upozila, 
    required this.district,     
  });

  Map< String, dynamic> toJson()=> {
    'id': id,
    'username': username,
    'bloodgroup': bloodgroup,
    'age': age,
    'email': email,
    'phonenumber': phonenumber,
    'village': village,
    'upozila': upozila,
    'district': district,
  };
   
   static Profile_page fromJson(Map<String, dynamic> json) => Profile_page(
    username: json['username'], 
    bloodgroup: json['bloodgroup'],
    age: json['age'], 
    email: json['email'], 
    phonenumber: json['phonenumber'], 
    village: json['village'], 
    upozila: json['upozila'], 
    district: json['district'],
   );
}