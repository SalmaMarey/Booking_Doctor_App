import 'package:flutter/material.dart';
import 'package:online_1/Profile.dart';

import 'package:online_1/screens/Doctors.dart';

import 'package:online_1/screens/homePage.dart';
import 'package:online_1/screens/profilePage.dart';

import 'package:online_1/screens/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'left/AboutPage.dart';

import 'left/ContactPage.dart';
import 'left/DoctorsList.dart';
import 'left/addRate.dart';

class leftHomePage extends StatefulWidget {
  leftHomePage({Key? key}) : super(key: key);

  @override
  State<leftHomePage> createState() => _leftHomePageState();
}

class _leftHomePageState extends State<leftHomePage> {
  int currentIndex = 0;
  List<Widget> page = [
    homePage(),
    DoctorsPage(),
    ProfilePage(),
  ];

  onIndexChanged(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "Welcome",
          style: TextStyle(
              fontSize: 30,
              color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: page[currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Colors.blue[900],
                  child: ListView(
                    children: [
                      SizedBox(height: 10),

                      Text(
                        " Hello ",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue.shade200,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: new DecorationImage(
                            image: NetworkImage(
                                'https://t4.ftcdn.net/jpg/03/43/44/13/240_F_343441388_JUR7mLwUvaGbDwdto5x8K22mx9o3BozL.jpg'),
                            // fit: BoxFit.fill,
                          ),
                        ),
                      )
                      // Image(
                      //   image: NetworkImage(
                      //       'https://t4.ftcdn.net/jpg/03/43/44/13/240_F_343441388_JUR7mLwUvaGbDwdto5x8K22mx9o3BozL.jpg'),
                      //   width: 100,
                      //   height: 100,
                      // )
                    ],
                  ),
                )),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const docList()),
                );
              },
              title: Text("Doctors List"),
              trailing: Icon(Icons.list),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddRate()),
                );
              },
              title: Text("Reviews"),
              subtitle: Text("rate us "),
              trailing: Icon(Icons.rate_review),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => contactPage()),
                );
              },
              title: Text("Contact Us"),
              trailing: Icon(Icons.contact_phone),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aboutPage()),
                );
              },
              title: Text("About Us"),
              subtitle: Text("Info about the app"),
              trailing: Icon(Icons.info),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            ListTile(
              title: Text("logout"),
              subtitle: Text("logout from your acoount"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("isLogin", false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => welcomePage()),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade200,
        onTap: onIndexChanged,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medication), label: "Doctors"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
