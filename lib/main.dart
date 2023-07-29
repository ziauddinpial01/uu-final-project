import 'package:blood_app/Extra_project/splash_screen.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/nav_bar_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      // home: Sign_in_page()
      // home: LoginTestScreen()
      home: Splash_Screen()
      // home: const Bottom_Nev_Page()
    );
  }
}



// import 'package:blood_app/Extra_project/app.dart';
// import 'package:blood_app/Extra_project/bottomNav/bottomNav_controller.dart';
// import 'package:blood_app/Extra_project/splash_screen.dart';
// import 'package:blood_app/Extra_project/user_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   try {

//   } catch (e) {
//     print('Init failed' + e.toString());
//   }
//   runApp( MyApp());
//   _init();
// }


// _init() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString("userID");
//   if (token != null) {
//     print('Token: $token');
//     Get.offAll(BottomNavBar());
//   } else {
//     // Get.offAll(BottomNavBar());
//     Get.offAll(Splash_Screen());
//   }
// }


