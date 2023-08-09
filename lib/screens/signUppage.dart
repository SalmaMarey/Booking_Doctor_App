import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_1/MyButton.dart';
import 'package:online_1/screens/leftHome.dart';
import 'package:online_1/screens/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUppage extends StatefulWidget {
  const signUppage({Key? key}) : super(key: key);

  @override
  State<signUppage> createState() => _signUppageState();
}

class _signUppageState extends State<signUppage> {
  bool loading = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String Username = "";
  String Phone_Number = "";
  String Gender = "";
  String Date_of_Birth = "";
  String Email = "";
  String Password = "";
  String City = "";
  Addreqs(
      {required String Username,
      required String Phone_Number,
      required String Gender,
      required String Date_of_Birth,
      required String Email,
      required String Password,
      required String City}) async {
    loading = true;
    setState(() {});
    try {
      CollectionReference reqs = FirebaseFirestore.instance.collection('Reqs');
      await reqs.add(
        {
          "Username": Username,
          "Phone_Number": Phone_Number,
          "Gender": Gender,
          "Date_of_Birth": Date_of_Birth,
          "Email": Email,
          "Password": Password,
          "City": City
        },
      );
      Navigator.of(context).pop();
      SnackBar snackBar = const SnackBar(
        content: Text('Reqs added'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      SnackBar snackBar = const SnackBar(
        content: Text('Error happend'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : InkWell(
                child: ListView(
                  children: [
                    Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => welcomePage()),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        iconSize: 40,
                        color: const Color(0xFF0D47A1),
                      ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF0D47A1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: ((value) {
                          Username = value;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Phone_Number",
                            prefixIcon: Icon(Icons.phone),
                          ),
                          onChanged: ((value) {
                            Phone_Number = value;
                          })),
                    ),
                    RadioListTile(
                      title: const Text("Male"),
                      value: "male",
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Female"),
                      value: "female",
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value.toString();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: "Date_of_Birth",
                            prefixIcon: Icon(Icons.date_range),
                          ),
                          onChanged: ((value) {
                            Date_of_Birth = value;
                          })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.length < 5) {
                              return "email must be more 5 letters";
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail),
                          ),
                          onChanged: ((value) {
                            Email = value;
                          })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "City",
                          prefixIcon: Icon(Icons.location_city_outlined),
                        ),
                        onChanged: ((value) {
                          City = value;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.length < 5) {
                              return "password must be more 5 letters";
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                          onChanged: ((value) {
                            Password = value;
                          })),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButton(
                        label: "Sign UP",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            isLoading = true;
                            Addreqs(
                                Username: Username,
                                Phone_Number: Phone_Number,
                                Gender: Gender,
                                Date_of_Birth: Date_of_Birth,
                                Email: Email,
                                Password: Password,
                                City: City);
                            setState(() {});
                            try {
                              UserCredential user = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: Email, password: Password);

                              print("user: ${user.user?.email}");
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => leftHomePage()),
                              );
                              SnackBar snackBar = const SnackBar(
                                content: Text('Welcome to the app'),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool("isLogin", true);
                              prefs.setString(
                                  "userEmail", "${user.user?.email}");
                              prefs.setString("userId", "${user.user?.uid}");
                            } catch (e) {
                              SnackBar snackBar = const SnackBar(
                                content: Text('Error happend'),
                              );
                            }
                          } else {
                            showErrorMesssage();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> showErrorMesssage() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Fix the following errors'),
            actions: <Widget>[
              TextButton(
                child: const Text('okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
