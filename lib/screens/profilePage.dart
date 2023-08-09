import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> data = ["Name: Salma", "Age: 21", "City: Mansoura"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: ListView(
        children: [
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
          Container(
            width: 120,
            height: 240,
            child: ListView.separated(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(data[index],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.indigo[900],
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          )
        ],
      ),
    );
  }
}
