import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfilePagee extends StatefulWidget {
  const ProfilePagee({Key? key}) : super(key: key);

  @override
  State<ProfilePagee> createState() => _ProfilePageeState();
}

class _ProfilePageeState extends State<ProfilePagee> {
  List<QueryDocumentSnapshot<Object?>> reqsList = [];
  @override
  void initState() {
    super.initState();
    getuser();
  }

  bool loading = false;
  String Username = "";
  String Phone_Number = "";
  String Gender = "";
  String Date_of_Birth = "";
  String Email = "";
  String Password = "";
  String City = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: ListView(children: [
          SizedBox(
            height: 15,
          ),
          CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),
        ]));
  }

  getuser() async {
    CollectionReference reqs = FirebaseFirestore.instance.collection('Reqs');
    QuerySnapshot data = await reqs.get();
    reqsList = data.docs;
    loading = false;
    setState(() {});

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: Password)
        .then((value) {
      // set personal user data by user id
      reqs.doc(FirebaseAuth.instance.currentUser!.uid).set({
        "Username": Username,
        "Phone_Number": Phone_Number,
        "Gender": Gender,
        "Date_of_Birth": Date_of_Birth,
        "Email": Email,
        "Password": Password,
        "City": City
      });
    });
  }
}
