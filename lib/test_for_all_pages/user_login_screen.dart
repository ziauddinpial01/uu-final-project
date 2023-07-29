import 'package:blood_app/Extra_project/color.dart';
import 'package:blood_app/test_for_all_pages/Sign_up_page.dart';
import 'package:blood_app/test_for_all_pages/sign_in_page.dart';
import 'package:blood_app/test_ui/background.dart';
import 'package:flutter/material.dart';

class UI_screen extends StatelessWidget {
  const UI_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
           
      body: Background(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Spacer(),
                Spacer(),
                Text("Wellcome to The Blood App", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
                Text("Take blood, donate blood, save live",style: TextStyle(fontSize: 15,)),
                SizedBox(height: 30,),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryColor,
                    image: DecorationImage(image: AssetImage("assets/images/blood.png",)),
                    shape: BoxShape.circle,
                    
                      
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textStyle: TextStyle(color: Colors.white,),
                padding: const EdgeInsets.all(0),
                ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_page(),));
                    },
                    child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1.0,
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
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
                ),
                    SizedBox(height: 50,),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textStyle: TextStyle(color: Colors.white,),
                padding: const EdgeInsets.all(0),
                ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_Up_page(),));
                    },
                    child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1.0,
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
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
                    ),
              
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}