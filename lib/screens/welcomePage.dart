import 'package:flutter/material.dart';
import 'package:online_1/screens/signInpage.dart';
import 'package:online_1/screens/signUppage.dart';

class welcomePage extends StatefulWidget {
  welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Welcome to our App",
          style: TextStyle(
              fontSize: 30,
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        Container(
          width: 250,
          height: 300,
          child: Image.asset("assets/aaa.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          const Padding(
            padding: EdgeInsets.only(right: 85),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 15.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const signInpage()),
              );
            },
            child: const Text(
              "SignIn",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 15.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const signUppage()),
              );
            },
            child: const Text(
              "SignUp",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ]),
    ));
  }
}
