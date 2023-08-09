import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'onBoarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBxsnAlpXUBMnJ-kcCVC84H8tZvjGeBBbc",
      appId: "1:20582317108:android:2077492da6e05394be9e61",
      messagingSenderId: "20582317108",
      projectId: "doctor-84472",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: PageOnBorarding(),
    );
  }
}
