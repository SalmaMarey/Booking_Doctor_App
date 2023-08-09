import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:online_1/screens/welcomePage.dart';

class PageOnBorarding extends StatelessWidget {
  const PageOnBorarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to our Health Care Clinic",
            body: "",
            image: Center(
              child: Image.asset("assets/1.png", height: 450.0, width: 400.0),
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Hope you enjoy using us",
            body: "",
            image: Image.asset("assets/s4.png", height: 450.0, width: 400.0),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "We wish you a speedy recovery ",
            body: "",
            image: Image.asset("assets/s8.png", height: 350.0, width: 300.0),
            decoration: getPageDecoration(),
          ),
        ],
        next: const Icon(
          Icons.arrow_forward,
          color: Color.fromARGB(255, 13, 71, 161),
        ),
        done: const Text('Done',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 13, 71, 161))),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text('Skip',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 13, 71, 161),
            )),
        // onSkip: () => print('skip'),
        // showBackButton: true,
        // back: const Icon(Icons.arrow_back),
        dotsDecorator: getDotDecoration(),
        nextFlex: 0,
        skipOrBackFlex: 0,
        animationDuration: 350,
        isProgressTap: true,
        isProgress: true,
        // freeze: false,
        onChange: (index) => print(index),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 13, 71, 161),
        ),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 13, 71, 161),
        ),
        imagePadding: EdgeInsets.all(24),
        titlePadding: EdgeInsets.zero,
        bodyPadding: EdgeInsets.all(20));
    // pageColor: Color(0xFFE3F2FD));
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
        color: const Color(0xFFBDBDBD),
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeColor: Colors.blue.shade900,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }

  void goToHome(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => welcomePage()),
    );
  }
}
