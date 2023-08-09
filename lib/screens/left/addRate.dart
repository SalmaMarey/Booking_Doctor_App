import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../MyButton.dart';

class AddRate extends StatefulWidget {
  const AddRate({Key? key}) : super(key: key);

  @override
  State<AddRate> createState() => _AddRateState();
}

class _AddRateState extends State<AddRate> {
  bool loading = false;
  String name = "";
  String rate = "";
  AddRate({required String name, required String rate}) async {
    loading = true;
    setState(() {});
    try {
      CollectionReference rates =
          FirebaseFirestore.instance.collection('Rates');
      await rates.add(
        {
          "rate": rate,
          "name": name,
        },
      );
      Navigator.of(context).pop();
      SnackBar snackBar = SnackBar(
        content: Text('rate added'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      SnackBar snackBar = SnackBar(
        content: Text('Error happend'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Rate"),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Name"),
                    onChanged: ((value) {
                      name = value;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Rate"),
                    onChanged: ((value) {
                      rate = value;
                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  label: "Add rate",
                  onTap: () {
                    AddRate(name: name, rate: rate);
                  },
                )
              ],
            ),
    );
  }
}
