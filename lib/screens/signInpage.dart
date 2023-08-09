import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_1/MyButton.dart';
import 'package:online_1/screens/homePage.dart';
import 'package:online_1/screens/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'leftHome.dart';

class signInpage extends StatefulWidget {
  const signInpage({Key? key}) : super(key: key);

  @override
  State<signInpage> createState() => _signInpageState();
}

class _signInpageState extends State<signInpage> {
  bool isPasswordHidden = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: InkWell(
          onTap: () {
            emailFocusNode.unfocus();
            passwordFocusNode.unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => welcomePage()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    iconSize: 40,
                    color: const Color(0xFF0D47A1),
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF0D47A1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              (Image.asset(
                "assets/s12.png",
                height: 320.0,
                width: 385.0,
                // fit: BoxFit.fill,
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.length < 5) {
                      return "email must be more 5 letters";
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: passwordFocusNode,
                  obscureText: isPasswordHidden,
                  validator: (value) {
                    if (value!.length < 5) {
                      return "password must be more 5 letters";
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordHidden = !isPasswordHidden;
                          setState(() {});
                        },
                        icon: Icon(isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                  label: "Sign In",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);

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

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool("isLogin", true);
                        prefs.setString("userEmail", "${user.user?.email}");
                        prefs.setString("userId", "${user.user?.uid}");
                      } catch (e) {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Error happend'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
