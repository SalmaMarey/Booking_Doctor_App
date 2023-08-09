import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class docList extends StatefulWidget {
  const docList({Key? key}) : super(key: key);

  @override
  State<docList> createState() => _docListState();
}

class _docListState extends State<docList> {
  List<QueryDocumentSnapshot<Object?>> doctorList = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getdocs();
  }

  getdocs() async {
    CollectionReference Doctors =
        FirebaseFirestore.instance.collection('Doctors');
    QuerySnapshot data = await Doctors.get();
    doctorList = data.docs;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors List"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: doctorList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    "${doctorList[index]["review"]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    "${doctorList[index]["name"]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${doctorList[index]["specialty"]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
