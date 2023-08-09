import 'package:flutter/material.dart';

class aboutPage extends StatefulWidget {
  aboutPage({Key? key}) : super(key: key);

  @override
  State<aboutPage> createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Text(
            "About Us",
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
            "A Booking an appointment with a doctor can be sometimes frustrating confusing and time consuming , so it would be really helpful to have an app on your phone that connects you to a variety of doctors , specialists.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 58, 99, 160),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "Idea and Goal The main:",
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "Goal was to create a unique application design for all the health and medical services all in one place to fasilitate peoples acces to health services.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          const Text(
            "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 58, 99, 160),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "Doctors:",
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "You can filter the search results by top reviewed doctors, most experienced. Most visited and my other options that helps you reach the right specialist for your case.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          const Text(
            "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 58, 99, 160),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "Appointments & Reviews: ",
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "An intuitive and easy interface for booking appointments and keeping record of all your medical dates.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          const Text(
            "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 58, 99, 160),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "Account: ",
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          Text(
            "An easy to use panel to reach all your personal informations.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Image(
              image: NetworkImage(
                  "https://t4.ftcdn.net/jpg/02/74/73/01/240_F_274730119_ht4FXz4R6RnIJgPk7WeNALxxaf524Jrb.jpg")),
        ]));
  }
}
