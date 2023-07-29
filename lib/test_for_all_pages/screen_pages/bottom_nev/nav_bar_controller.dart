import 'package:blood_app/Extra_project/color.dart';
import 'package:blood_app/test_for_all_pages/reuseable_widget/dower.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/blood_donation_page.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/blood_needed_page.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/bottom_nev/profile_page.dart';
import 'package:flutter/material.dart';

class Bottom_Nev_Page extends StatefulWidget {
  const Bottom_Nev_Page({Key? key}) : super(key: key);

  @override
  State<Bottom_Nev_Page> createState() => _Bottom_Nev_PageState();
}

class _Bottom_Nev_PageState extends State<Bottom_Nev_Page> {
  int index = 0;
  final screens = [
    Blood_Donation_screen(), 
    Blood_Needed_Page(), 
    Profile_page(),
    // ChatScreen(), 
    
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.red,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.bloodtype_rounded), label: 'Blood Donner'),
            NavigationDestination(
                icon: Icon(Icons.bloodtype), label: ' Blood Needed'),
            // NavigationDestination(
            //     icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
            NavigationDestination(
                icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
