// TODO Implement this library.
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Text(
          "Hello",
          style: TextStyle(fontSize: 38, color: Colors.black),
          textAlign: TextAlign.left,

        ),
      ),
    );
  }
}