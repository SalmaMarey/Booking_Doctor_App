import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String label;
  void Function()? onTap;
  MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 240,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
