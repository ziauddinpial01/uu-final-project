
import 'package:blood_app/test_for_all_pages/firebase_connetion/firebase_models.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/pages/Profile_pages/Profile_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreLoginHelper {


  static Future createData(UserLoginModel user) async {
  final userCollection = FirebaseFirestore.instance.collection('userslogin');

  final uid = userCollection.doc().id;
  final docRef = userCollection.doc(uid);

  final newUser = UserLoginModel(
    id: uid,
    username: user.username,
    Phonenumber: user.Phonenumber,
    location: user.location,
    email: user.email,
    password: user.password
  ).tojson();

  try {
    await docRef.set(newUser);
  } catch (e) {
    print('Some error occured $e');
  }

}

  static Future update(Profile_page user) async {
  final userCollection = FirebaseFirestore.instance.collection('profile_page');

  final docRef = userCollection.doc(user.id);

  final newUser = Profile_page(
    id: user.id,
    bloodgroup: user.bloodgroup,
    district: user.district,
    phonenumber: user.phonenumber,
    upozila: user.upozila,
    village: user.village,
    username: user.username,
    age: user.age,
    email: user.email,
  ).toJson();

  try {
    await docRef.update(newUser);
  } catch (e) {
    print('Some error occured $e');
  }

}

// read data from firebase


}