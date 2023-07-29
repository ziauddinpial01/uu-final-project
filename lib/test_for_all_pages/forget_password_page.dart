import 'package:blood_app/test_for_all_pages/reuseable_widget/textformfield.dart';
import 'package:blood_app/test_ui/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Forget_password_screen extends StatefulWidget {
  @override
  _Forget_password_screenState createState() => _Forget_password_screenState();
}

class _Forget_password_screenState extends State<Forget_password_screen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();

  String _email = '';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Forgot Password'),
          backwardsCompatibility: false,
        ),
        body: Background(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2661FA),
                  fontSize: 36),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),

          // Container(
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.symmetric(horizontal: 30),
          //   child: TextFormField(
          //     controller: _emailController,
          //     keyboardType: TextInputType.text,
          //     decoration: InputDecoration(
          //       labelText: "Sent Email",
          //       hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         borderSide: BorderSide(
          //             width: 1, style: BorderStyle.solid, color: Colors.blue),
          //       ),
          //       fillColor: Colors.white,
          //     ),
          //   ),
          // ),
          // SizedBox(height: size.height * 0.05),
          TextFormFieldWiget(
            hintText: "Enter Email",
            controller: _emailController,
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () async {
                try {
                 await _auth
                      .sendPasswordResetEmail(
                          email: _emailController.text.toString())
                      .then(((value) {
                    Navigator.pop(context);
                    // toastmessage('Please check your email, a reset link has been sent to your via email');
                  })).onError((error, stackTrace) {
                    error.toString();
                  });
                } catch (e) {
                  print(e.toString());
                  // toastmessage(e.toString());
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(0),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 136, 34),
                      Color.fromARGB(255, 255, 177, 41)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Recover Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ])));
  }

  // void toastmessage(String message){
  //   Fluttertoast.showToast(
  //       msg: "This is Center Short Toast",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  // }
}
