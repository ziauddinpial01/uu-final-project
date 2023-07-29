import 'package:blood_app/test_for_all_pages/firebase_connetion/firebase_models.dart';
import 'package:blood_app/test_for_all_pages/firebase_connetion/login_firebase_helper.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/nav_bar_controller.dart';
import 'package:blood_app/test_for_all_pages/sign_in_page.dart';
import 'package:blood_app/test_ui/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Sign_Up_page extends StatefulWidget {
  const Sign_Up_page({super.key});

  @override
  State<Sign_Up_page> createState() => _Sign_Up_pageState();
}

class _Sign_Up_pageState extends State<Sign_Up_page> {
  
  var _isVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
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
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(       
        body: SingleChildScrollView(
          child: Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 SizedBox(height: size.height * 0.20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.03),            
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.text,                          
                                decoration: InputDecoration(
                                  labelText: "User Name",
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
                                // validator: MultiValidator([
                                //   RequiredValidator(errorText: "Required"),
                                //   EmailValidator(errorText: "Not A Valid Email")
                                // ]),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.text,                          
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
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
                SizedBox(height: size.height * 0.02),
               Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.text,
                              
                              decoration: InputDecoration(
                                labelText: "Enter Your Email",
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                                EmailValidator(errorText: "Not A Valid Email")
                              ]),
                            ),
                          ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(                
                              controller: _passwordController,
                              obscureText: _isVisible ? false : true,
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
                              validator: validatepass,
                            ),
                    // obscureText: true,
                  ),
                  SizedBox(height: size.height * 0.02),
               Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                              controller: _locationController,
                              keyboardType: TextInputType.text,
                              
                              decoration: InputDecoration(
                                labelText: "Current Location",
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                                EmailValidator(errorText: "Not A Valid Email")
                              ]),
                            ),
                          ),
                SizedBox(height: size.height * 0.01),
                SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () async{                  
                       try {
                        final user = await auth.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text.toString().trim(),
                        );
                        if(user != null ){
                           FirestoreLoginHelper.createData(UserLoginModel(
                          username: _usernameController.text,
                          Phonenumber: _phoneController.text, 
                      email: _emailController.text,
                      password: _passwordController.text,
                      location: _locationController.text
                      ));
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
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40,),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_page()))
                },
                child: Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)
                  ),
                ),
              ),
            ),                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}