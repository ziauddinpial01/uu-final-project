import 'package:blood_app/test_for_all_pages/Sign_up_page.dart';
import 'package:blood_app/test_for_all_pages/forget_password_page.dart';
import 'package:blood_app/test_for_all_pages/reuseable_widget/textformfield.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/nav_bar_controller.dart';
import 'package:blood_app/test_ui/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sign_in_page extends StatefulWidget {   
 @override
  State<Sign_in_page> createState() => _Sign_in_pageState();
}

  class _Sign_in_pageState extends State<Sign_in_page> {     
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _isVisible = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  void validated() {
    if (fromkey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not Validates');
    }
  }

  String? validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Should be at least 6 character";
    } else if (value.length > 15) {
      return "Should not be more then 15 character";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2661FA),
                  fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // Container(
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.symmetric(horizontal: 30), 
            //   child: TextFormField(
            //               controller: _emailController,
            //               keyboardType: TextInputType.text,                          
            //               decoration: InputDecoration(
            //                 labelText: "Enter Your Email",
            //                 hintStyle: TextStyle(
            //                     fontSize: 12, fontWeight: FontWeight.bold),
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   borderSide: BorderSide(
            //                       width: 1,
            //                       style: BorderStyle.solid,
            //                       color: Colors.blue),
            //                 ),
            //                 fillColor: Colors.white,
            //               ),
            //               validator: (value) {
            //                 if (value == null || value.isEmpty){
            //                   return "Please enter an Email";
            //                 }
            //                 return  null;
            //               }
            //             ),
            //           ),
            TextFormFieldWiget(hintText: 'Enter Your Email', controller: _emailController),
                      SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(                
                          controller: _passwordController,
                          obscureText: _isVisible ? false : true,
                          validator: (value) {
                            if (value == null || value.isEmpty){
                              return "Please enter an Email";
                            }
                            return  null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: Icon(
                                  _isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                )),
                            hintStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                             border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.blue),
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
              ),
              SizedBox(height: size.height * 0.03),
               Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Forget_password_screen(),));
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0XFF2661FA)
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final users = await auth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text.toString().trim(),
                      );
                      if (users != null) {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Bottom_Nev_Page()),); 
                      }
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textStyle: TextStyle(color: Colors.white,),
                padding: const EdgeInsets.all(0),
                  ),
                  child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ]
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40,),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_Up_page()))
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)
                  ),
                ),
              ),
            )
          ]
            )            
        )
      );
    
  }
}
