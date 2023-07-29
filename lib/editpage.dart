// import 'package:blood_app/models/user_model.dart';
// import 'package:blood_app/remote_datasource/firebase_healper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class EditPage extends StatefulWidget {
//   final UserModel user;
//   const EditPage({super.key, required this.user});

//   @override
//   State<EditPage> createState() => _EditPageState();
// }

// class _EditPageState extends State<EditPage> {
//    TextEditingController? _usernameController;
//   TextEditingController? _ageController;
//   TextEditingController? _emailController;

//   @override
//   void initState() {
//     _usernameController =TextEditingController(text: widget.user.username);
//     _ageController =TextEditingController(text: widget.user.age);
//     _emailController =TextEditingController(text: widget.user.email);
//     super.initState();
//     super.initState();
//     super.initState();
    
//   }

//   @override
//   void dispose() {
//     _usernameController!.dispose();
//     _ageController!.dispose();
//     _emailController!.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Edit Page"),
//         ),
//         body: Padding(padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "User Name"
//                 ),
//               ),
//               SizedBox(height: 10,),
//               TextFormField(
//                 controller: _ageController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Age"
//                 ),
//               ),
//               SizedBox(height: 10,),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Email"
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   FirestoreHelper.update(UserModel(
//                     id: widget.user.id, 
//                     username: _usernameController!.text, 
//                     age: _ageController!.text,
//                     email: _emailController!.text,
                    
//                     )).then((value) =>{
//                     Navigator.pop(context)
//                   });
//                 },
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.green
//                   ),
//                   child: Center(child: Text("Update")),
//                 ),
//               ),
//           ],
//         ),
//         ),
        
//       ),
//     );
//   }
// }
