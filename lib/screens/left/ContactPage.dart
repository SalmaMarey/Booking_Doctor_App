import 'package:flutter/material.dart';

class contactPage extends StatefulWidget {
  contactPage({Key? key}) : super(key: key);

  @override
  State<contactPage> createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        body: ListView(children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            " Team Members:",
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "   -Salma Ahmed Marey.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: 90,
          ),
          Center(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Text(
                  "Thanks you for watching!",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
                Container(
                  width: 500,
                  height: 300,
                  child: Image.asset("assets/nn.png"),
                ),
              ])))
        ]));
  }
}
