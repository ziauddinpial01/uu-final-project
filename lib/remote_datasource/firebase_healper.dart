
import 'package:blood_app/test_for_all_pages/firebase_connetion/firebase_models.dart';
import 'package:blood_app/test_for_all_pages/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {


  static Future create(UserModel user) async {
  final userCollection = FirebaseFirestore.instance.collection('users');

  final uid = userCollection.doc().id;
  final docRef = userCollection.doc(uid);

  final newUser = UserModel(
    id: uid,
    username: user.username,
    age: user.age,
    email: user.email,
    password: user.password
  ).tojson();

  try {
    await docRef.set(newUser);
  } catch (e) {
    print('Some error occured $e');
  }

}

  static Future update(UserLoginModel user) async {
  final userCollection = FirebaseFirestore.instance.collection('userslogin');

  final docRef = userCollection.doc(user.id);

  final newUser = UserLoginModel(
    id: user.id,
    username: user.username,
    Phonenumber: user.Phonenumber,
    location: user.location,
    email: user.email,
    password: user.password
  ).tojson();

  try {
    await docRef.update(newUser);
  } catch (e) {
    print('Some error occured $e');
  }

}


//   static Future delete(UserModel user) async {
//   final userCollection = FirebaseFirestore.instance.collection('users');

//   final docRef = userCollection.doc(user.id).delete();
// }






// read data from firebase


}