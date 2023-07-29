import 'package:blood_app/test_for_all_pages/reuseable_widget/dower.dart';
import 'package:blood_app/test_for_all_pages/reuseable_widget/reuseable_row.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/pages/Doner_pages/doner_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Blood_Donation_screen extends StatefulWidget {

  @override
  State<Blood_Donation_screen> createState() => _Blood_Donation_screenState();
}

class _Blood_Donation_screenState extends State<Blood_Donation_screen> {
    TextEditingController searchController = TextEditingController();
    String search = "" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drower(),
        appBar: AppBar(
          title: Text('Blood Donnetion', style: TextStyle(fontSize: 25,),),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('blood-donner-page')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                            controller: searchController,
                            keyboardType: TextInputType.text,                          
                            decoration: InputDecoration(
                              labelText: "Search Here with blood group",
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
                            onChanged: (String value) {
                              setState(() {
                                search = value;
                              });
                              
                            },
                            
                          ),
                ),
                Expanded(
                  child: ListView(
                    children: snapshot.data!.docs.map((document) {
                      String tempTitle = document['bloodgroup'];
                      if(searchController.text.isEmpty){
                        return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Card(
                              color: Colors.green.shade100,
                              shadowColor: Colors.red.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ResuableRow(
                                            title: 'Name: ', value: document['name']),
                                        ResuableRow(
                                            title: 'Age: ', value: document['age']),
                                      ],
                                    ),
                                    ResuableRow(
                                      title: 'Phone Number: ',
                                      value: document['phonenumber'].toString(),
                                    ),
                                    ResuableRow(
                                      title: 'Donation Date: ',
                                      value: document['donationdate'],
                                    ),
                                    ResuableRow(
                                      title: 'Hospital Name: ',
                                      value: document['hospitalname'],
                                    ),
                                    ResuableRow(
                                      title: 'Upozila: ',
                                      value: document['upozila'],
                                    ),
                                    ResuableRow(
                                      title: 'District: ',
                                      value: document['district'],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Positioned(
                                left: -15,
                                top: 120,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(
                                    document['bloodgroup'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            ListTile(
                              trailing: InkWell(
                                  onTap: (() {
                                    final documentReference = FirebaseFirestore
                                        .instance
                                        .collection('blood-donner-page')
                                        .doc(document.id);
                                    documentReference.delete();
                                  }),
                                  child: Icon(Icons.delete)),
                            )
                          ],
                        ),
                      );
                      }else if(tempTitle.toLowerCase().contains(searchController.text.toString())){
                         return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Card(
                              color: Colors.green.shade100,
                              shadowColor: Colors.red.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ResuableRow(
                                            title: 'Name: ', value: document['name']),
                                        ResuableRow(
                                            title: 'Age: ', value: document['age']),
                                      ],
                                    ),
                                    ResuableRow(
                                      title: 'Phone Number: ',
                                      value: document['phonenumber'].toString(),
                                    ),
                                    ResuableRow(
                                      title: 'Donation Date: ',
                                      value: document['donationdate'],
                                    ),
                                    ResuableRow(
                                      title: 'Hospital Name: ',
                                      value: document['hospitalname'],
                                    ),
                                    ResuableRow(
                                      title: 'Upozila: ',
                                      value: document['upozila'],
                                    ),
                                    ResuableRow(
                                      title: 'District: ',
                                      value: document['district'],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Positioned(
                                left: -15,
                                top: 120,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(
                                    document['bloodgroup'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            ListTile(
                              trailing: InkWell(
                                  onTap: (() {
                                    final documentReference = FirebaseFirestore
                                        .instance
                                        .collection('blood-donner-page')
                                        .doc(document.id);
                                    documentReference.delete();
                                  }),
                                  child: Icon(Icons.delete)),
                            )
                          ],
                        ),
                      );
                      } else {
                        return Container();
                      }
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Blood_Donner_page(),
                ));
          },backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ));
  }

  Future<void> deleteDocument() async {
    // Get a reference to the document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('blood-donner-page')
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
  // final hiveManageC = Get.put(HiveManageController(), permanent: true);

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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(widget.value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              // SizedBox(width: 50,),
            ],
          ),
        ],
      ),
    );
  }
}
