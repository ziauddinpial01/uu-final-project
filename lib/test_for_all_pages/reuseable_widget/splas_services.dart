
import 'dart:async';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/nav_bar_controller.dart';
import 'package:blood_app/test_for_all_pages/user_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplasServices{
  void isLogin(BuildContext, context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(Duration(seconds: 3), () => 
      Navigator.push(context, MaterialPageRoute(builder: (context) => UI_screen(),)),);
    }else{
      Timer(Duration(seconds: 3), () => 
      Navigator.push(context, MaterialPageRoute(builder: (context) => Bottom_Nev_Page(),)),);
    }
  }
}