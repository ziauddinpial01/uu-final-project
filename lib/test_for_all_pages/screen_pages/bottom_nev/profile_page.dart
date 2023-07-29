import 'package:blood_app/test_for_all_pages/firebase_connetion/firebase_models.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/pages/Profile_pages/Profile_settings/profile_editing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile_page extends StatefulWidget {
  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile',style: TextStyle(fontSize: 25,),),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              FirebaseFirestore.instance.collection('userslogin').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Center(
                            child: Text(
                          document['username'],
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            height: 120,
                            child: FittedBox(
                                child: Icon(Icons.person_pin_rounded)),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  final documentReference = FirebaseFirestore
                                  .instance
                                  .collection('userslogin')
                                  .doc(document.id);
                              documentReference.delete();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF660000)),
                                child: Text('Delete Profile')),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEditing(user: UserLoginModel(
                                    username: document['username'],
                                    email: document['email'],
                                    id: document.id,
                                    Phonenumber: document['Phonenumber'],
                                    location: document['location'],
                                  )),));
                                  },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey),
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Edit Profile'),
                                  ],
                                )
                                )
                          ],
                        ),
                        SizedBox(height: 20),
                        Line(),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Basic info",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),                                  
                                color: Colors.grey.shade300,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Re_Use_able_Row(
                                        title: 'User Name: ',
                                        value: document['username'],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Line(),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Contact Info ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 110,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),                                  
                                color: Colors.grey.shade300,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Re_Use_able_Row(
                                        title: 'Phone: ',
                                        value: document['Phonenumber']),
                                        SizedBox(height: 10),
                              Re_Use_able_Row(
                                  title: 'Email: ', value: document['email']),
                                  SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Line(),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location Info ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),                                  
                                color: Colors.grey.shade300,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Re_Use_able_Row(
                                        title: 'Current Location: ',
                                        value: document['location']),
                              SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,)
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
        );
  }

Future<void> deleteDocument() async {
    // Get a reference to the document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('userslogin')
        .doc('user.id');

    // Delete the document
    await documentReference.delete();
  }
}

class Re_Use_able_Row extends StatefulWidget {
  final String title, value;
  final IconData? icon;
  final Widget? child;

  Re_Use_able_Row({
    Key? key,
    required this.title,
    required this.value,
    this.child,
    this.icon,
  }) : super(key: key);

  @override
  State<Re_Use_able_Row> createState() => _Re_Use_able_RowState();
}

class _Re_Use_able_RowState extends State<Re_Use_able_Row> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                child: widget.child,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(widget.value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class ListOfProfile extends StatelessWidget {
  const ListOfProfile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.images,
  }) : super(key: key);
  final String title, subtitle;
  final String? images;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(images!))),
          // FittedBox(
          //          alignment: Alignment.center,
          // clipBehavior: Clip.none,
          //         child: Image.asset(images!,fit: BoxFit.fill,),
          //       ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6, width: double.infinity, color: Colors.grey.withOpacity(0.3));
  }
}
