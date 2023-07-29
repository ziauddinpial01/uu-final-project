import 'package:blood_app/test_for_all_pages/reuseable_widget/reuseable_row.dart';
import 'package:blood_app/test_for_all_pages/screen_pages/pages/needer_pages/needed_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Blood_Needed_Page extends StatefulWidget {
  @override
  State<Blood_Needed_Page> createState() => _Blood_Needed_PageState();
}

class _Blood_Needed_PageState extends State<Blood_Needed_Page> {
  TextEditingController searchController = TextEditingController();
    String search = "" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Needed', style: TextStyle(fontSize: 25,),),
        centerTitle: true,
          backgroundColor: Colors.grey,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('blood-needed-page').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              labelText: "Search Here with blood Group",
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
                                        title: 'Name: ',
                                        value: document['name']
                                        ),
                                    ResuableRow(
                                        title: 'Age: ',
                                        value: document['age']
                                        ),
                                  ],
                                ),             
                                ResuableRow(
                                    title: 'Phone Number: ',
                                    value: document['phonenumber'].toString(),
                                    ),
                                    ResuableRow(title: 'Hospital Name: ' , value: document['hospitalname'],),
                                    ResuableRow(title: 'Upozila: ', value: document['upozila'],),
                                   
                               ResuableRow(
                                    title: 'District: ',
                                    value: document['district'],),
                               
              
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Positioned(
                            left: -15,
                            top: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text(
                                document['bloodgroup'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                            ),
                                ListTile(
                                trailing: InkWell( onTap: (() {
                                  final documentReference = FirebaseFirestore
                                        .instance
                                        .collection('blood-needed-page')
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
                                        title: 'Name: ',
                                        value: document['name']
                                        ),
                                    ResuableRow(
                                        title: 'Age: ',
                                        value: document['age']
                                        ),
                                  ],
                                ),             
                                ResuableRow(
                                    title: 'Phone Number: ',
                                    value: document['phonenumber'].toString(),
                                    ),
                                    ResuableRow(title: 'Hospital Name: ' , value: document['hospitalname'],),
                                    ResuableRow(title: 'Upozila: ', value: document['upozila'],),
                                   
                               ResuableRow(
                                    title: 'District: ',
                                    value: document['district'],),
                               
              
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Positioned(
                            left: -15,
                            top: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text(
                                document['bloodgroup'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                            ),
                                ListTile(
                                trailing: InkWell( onTap: (() {
                                  final documentReference = FirebaseFirestore
                                        .instance
                                        .collection('blood-needed-page')
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Blood_Needed_Screen(),));
        
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
      )
    );
    
  }

  Future<void> deleteDocument() async {
    // Get a reference to the document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('blood-needed-page')
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
          height: 50,
          width: 50,
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
            Text(title),
            SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12),
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
