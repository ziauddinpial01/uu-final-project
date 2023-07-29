import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drower extends StatelessWidget {
  const Drower({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(),
        children: [
       UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: new Color(0xFF0062ac),
                
              ),
              accountName: Text("Blood Donation App"),
              accountEmail: Text("hotline : 01741-070153\n               01741070153"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? new Color(0xFF0062ac)
                        : Colors.white,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/blood.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                   
                  ),
                ), 
              ),
            ),
          ListTile(
            leading: Icon(Icons.home),
            hoverColor: Colors.redAccent,
            title: Text('Home'),
            onTap: () {
              //  Navigator.pushNamed(context, '/homeview');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_outlined ),
            hoverColor: Colors.blueGrey,
            title: Text('About'),
            onTap: () {
            // Navigator.pushNamed(context, AppConstant.about);   
            },
          ),
           ListTile(
            leading: Icon(Icons.settings),
            hoverColor: Colors.blueGrey,
            title: Text('Settings'),
            onTap: () {
            // Navigator.pushNamed(context, AppConstant.department);   
            },
          ),          
           ListTile(
            leading: Icon(Icons.photo),
            hoverColor: Colors.blueGrey,
            title: Text('Gallery'),
            onTap: () {
            // Navigator.pushNamed(context, AppConstant.galary);   
            },
          ), 
          ListTile(
            leading: Icon(Icons.add_ic_call_rounded ),
            hoverColor: Colors.blueGrey,
            title: Text('Contact Us'),
            onTap: () {
            // Navigator.pushNamed(context, AppConstant.Contact_us);   
            },
          ),
          ListTile(
            leading: Icon(Icons.light_mode ),
            hoverColor: Colors.blueGrey,
            title: Text('Light Theme'),
            onTap: () {
            Get.changeTheme(ThemeData.light());  
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode ),
            hoverColor: Colors.blueGrey,
            title: Text('Dark Theme'),
            onTap: () {
            Get.changeTheme(ThemeData.dark());   
            },
          ),
          ListTile(
            leading: Icon(Icons.logout ),
            hoverColor: Colors.blueGrey,
            title: Text('Log Out'),
            onTap: () {
            // Navigator.pushNamed(context, AppConstant.Contact_us);   
            },
          ),
        
        ],
      ),
      
    );
  }
}
