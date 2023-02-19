import 'package:flutter/material.dart';
// import 'package:flutter_flow/flutter_flow_theme.dart';
// import 'package:flutter_flow/flutter_flow_util.dart';
// import 'package:testing/login_screen.dart';
// import 'package:testing/login_screen.dart';


import 'pages/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Screen ",
      home: LoginScreen(),
    ),
  );
}