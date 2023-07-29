import 'package:blood_app/remote_datasource/firebase_healper.dart';
import 'package:blood_app/test_for_all_pages/firebase_connetion/firebase_models.dart';
import 'package:flutter/material.dart';

class ProfileEditing extends StatefulWidget {
  final UserLoginModel user;
  const ProfileEditing({super.key, required this.user});

  @override
  State<ProfileEditing> createState() => _ProfileEditingState();
}

class _ProfileEditingState extends State<ProfileEditing> {
  TextEditingController? _usernameController;
  TextEditingController? _phonenumberController;
  TextEditingController? _emailController;
  TextEditingController? _locationController;

  @override
  void initState() {
    _usernameController =TextEditingController(text: widget.user.username);
    _phonenumberController =TextEditingController(text: widget.user.Phonenumber);
    _emailController =TextEditingController(text: widget.user.email);
    _locationController =TextEditingController(text: widget.user.location);
    super.initState();
    super.initState();
    super.initState();
    super.initState();
    
  }

  @override
  void dispose() {
    _usernameController!.dispose();
    _phonenumberController!.dispose();
    _emailController!.dispose();
    _locationController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Page", style: TextStyle(fontSize: 25,),),
          centerTitle: true,
          backgroundColor: Colors.grey,
         
        ),
        body: Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: [
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
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _phonenumberController,
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
                            ),
                          ),
                SizedBox(height: size.height * 0.02),
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
                            ),
                          ),
                SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: InkWell(
                  onTap: () {
                    FirestoreHelper.update(UserLoginModel(
                      id: widget.user.id, 
                      username: _usernameController!.text,
                      Phonenumber: _phonenumberController!.text,
                      location: _locationController!.text, 
                      email: _emailController!.text,
                      
                      )).then((value) =>{
                      Navigator.pop(context)
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1.5,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ]
                    )
                  ),
                    child: Center(child: Text("Update")),
                  ),
                ),
              ),
          ],
        ),
        ),
        
      ),
    );
  }
}
