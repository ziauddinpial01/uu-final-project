// import 'package:blood_app/editpage.dart';
// import 'package:blood_app/models/user_model.dart';
// import 'package:blood_app/test_for_all_pages/models/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
  
// class AddData extends StatelessWidget {
  
//   @override
// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text("Read data"),
//       ),
//       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }  
//           return ListView(
//             children: snapshot.data!.docs.map((document) {
//               return ListTile(
//                 leading: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle
//                   ),
//                   child: Center(child: Text(document['age'].toString())),
//                 ),
//                 title: Text(document['username']),
//                 subtitle: Text(document['age'].toString()),
      
//                 trailing: SizedBox(
//                   height: 50,
//                   width: 80,
//                   child: Row(
                    
//                     children: [
//                       InkWell( onTap: (() {
//                         Navigator.push(context, MaterialPageRoute(builder: ((context) => EditPage(
//                           user: UserModel(
//                             username: document['username'], 
//                             age: document['age'].toString(), 
//                             id: document.id,
//                             email: document['email'], 
//                             // password: document['password'], 
//                             ),
//                         ))));
//                       }),
//                         child: Icon(Icons.edit)),
      
//                         SizedBox(width: 20,),
//                       InkWell( onTap: (() {
//                         final documentReference = FirebaseFirestore.instance.collection('users').doc(document.id);
//                         documentReference.delete();
//                       }),
//                         child: Icon(Icons.delete)),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
    
//   }
  
//   Future<void> deleteDocument() async {
    
//   // Get a reference to the document
//   DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc('user.id');

//   // Delete the document
//   await documentReference.delete();
// }


// // Future<void> deleteField() async {
// //   // Get a reference to the document
// //   DocumentReference documentReference =
// //       FirebaseFirestore.instance.collection('users').doc('user.id');

// //   // Update the field to delete by setting it to null
// //   await documentReference.update({'field_to_delete': FieldValue.delete()});
// // }

// }

