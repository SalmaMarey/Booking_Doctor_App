import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../MyButton.dart';
import '../leftHome.dart';

class Doc1Page extends StatefulWidget {
  Doc1Page({Key? key}) : super(key: key);

  @override
  State<Doc1Page> createState() => _Doc1PageState();
}

class _Doc1PageState extends State<Doc1Page> {
  List<QueryDocumentSnapshot<Object?>> Doc1List = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getDoc1();
  }

  getDoc1() async {
    CollectionReference Doc1 = FirebaseFirestore.instance.collection('Doc1');
    QuerySnapshot data = await Doc1.get();
    Doc1List = data.docs;
    loading = false;
    setState(() {});
  }

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String Session_Type = "";
  String Date = "";
  String Age = "";
  String Patient_Name = "";
  String Phone_Number = "";
  AddBook1(
      {required String Session_Type,
      required String Date,
      required String Patient_Name,
      required String Age,
      required String Phone_Number}) async {
    loading = true;

    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        CollectionReference Book1 =
            FirebaseFirestore.instance.collection('Book1');
        await Book1.add(
          {
            "Session_Type": Session_Type,
            'Date': Date,
            'Age': Age,
            'Patient_Name': Patient_Name,
            'Phone_Number': Phone_Number
          },
        );
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text('Reqs added'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (e) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text('Error happend'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: Colors.blue.shade50,
            appBar: AppBar(
              backgroundColor: Colors.blue.shade200,
              title: Text(
                "Mental Therapist",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),
            body: ListView.builder(
                itemCount: Doc1List.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://t4.ftcdn.net/jpg/03/05/41/27/240_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg"),
                      ),
                      Text(
                        "${Doc1List[index]["Name"]}" +
                            "     " +
                            "${Doc1List[index]["Fees"]}",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 45.0,
                        width: 190.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            child: new Center(
                              child: new Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${Doc1List[index]["Description"]}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Patient_Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value!.length < 1) {
                              return "email must be more 1 letter";
                            }
                          },
                          onChanged: ((value) {
                            Patient_Name = value;
                          }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Age",
                              prefixIcon: Icon(Icons.view_agenda),
                            ),
                            validator: (value) {
                              if (value!.length < 1) {
                                return "email must be more 1 letter1";
                              }
                            },
                            onChanged: ((value) {
                              Age = value;
                            })),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Phone_Number",
                              prefixIcon: Icon(Icons.phone),
                            ),
                            validator: (value) {
                              if (value!.length < 4) {
                                return "email must be more 4 letters";
                              }
                            },
                            onChanged: ((value) {
                              Phone_Number = value;
                            })),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              labelText: "Date",
                              prefixIcon: Icon(Icons.date_range),
                            ),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "email must be more 2 letters";
                              }
                            },
                            onChanged: ((value) {
                              Date = value;
                            })),
                      ),
                      RadioListTile(
                        title: Text("First Admission"),
                        value: "First Admission",
                        groupValue: Session_Type,
                        onChanged: (value) {
                          setState(() {
                            Session_Type = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Follow up session"),
                        value: "Follow up session",
                        groupValue: Session_Type,
                        onChanged: (value) {
                          setState(() {
                            Session_Type = value.toString();
                          });
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: MyButton(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Welcome"),
                                    content: const Text(
                                        "Appointment Added Successfully, We will send you a messege with the time for the appointment."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          AddBook1(
                                              Session_Type: Session_Type,
                                              Date: Date,
                                              Age: Age,
                                              Patient_Name: Patient_Name,
                                              Phone_Number: Phone_Number);
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.blue[900],
                                          padding: const EdgeInsets.all(14),
                                          child: const Text(
                                            "Okay",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              label: 'Book appiontment',
                            ),
                          ))
                    ],
                  ));
                })));
  }
}
