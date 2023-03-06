import 'package:flutter/material.dart';
import 'package:flutter_burnner/pages/easy_play.dart';
import 'package:flutter_burnner/pages/home_screen.dart';
import 'package:flutter_burnner/pages/select_difficulty.dart';
import 'package:flutter_burnner/pages/setting_screen.dart';
import 'package:flutter_burnner/pages/sign_up_screen.dart';
import 'pages/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';




Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Screen ",
       home: MainPage(),
       routes: {
        '/easy-play': (ctx) => EasyPlay(),
        '/select-difficulty': (ctx) => SelectDifficulty(),
        '/login': (ctx) => LoginScreen(),
        '/sign-up': (ctx) => SignUpScreen(),
        '/home': (ctx) => HomeScreen(),
         '/settings': (ctx) => SettingScreen(),
      },
    ),
  );
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        }
        else
          {
            return LoginScreen();
          }
      },
    ),
  );
}