import 'package:flutter/material.dart';
import 'package:flutter_burnner/pages/easy_play.dart';
import 'package:flutter_burnner/pages/select_difficulty.dart';
import 'pages/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Screen ",
      home: LoginScreen(),
      routes: {
        '/easy-play': (ctx) => EasyPlay(),
        '/select-difficulty': (ctx) => SelectDifficulty(),
      },
    ),
  );
}