import 'package:flutter/material.dart';
import 'package:flutter_burnner/layouts/default.dart';
import 'package:flutter_burnner/pages/competition/hard_mode.dart';
import 'package:flutter_burnner/pages/congrats.dart';
import 'package:flutter_burnner/pages/competition/easy_mode.dart';
import 'package:flutter_burnner/pages/home_screen.dart';
import 'package:flutter_burnner/pages/competition/medium_mode.dart';
import 'package:flutter_burnner/pages/competition/select_difficulty.dart';
import 'package:flutter_burnner/pages/learning_content.dart';
import 'package:flutter_burnner/pages/score_board.dart';
import 'package:flutter_burnner/pages/setting_screen.dart';
import 'package:flutter_burnner/pages/sign_up_screen.dart';
import 'package:flutter_burnner/pages/test_kim.dart';
import 'package:flutter_burnner/pages/practice_mode.dart';
import 'package:flutter_burnner/providers/china_quest.dart';
import 'package:flutter_burnner/providers/counter_provider.dart';
import 'package:flutter_burnner/providers/heart.dart';
import 'package:flutter_burnner/providers/timer.dart';
import 'package:flutter_burnner/providers/users_score_load.dart';
import 'pages/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterStrike()),
        ChangeNotifierProvider(create: (_) => QuestionChinaProvider()),
        ChangeNotifierProvider(create: (_) => Heart()),
        ChangeNotifierProvider(create: (_) => TimerCount()),
        ChangeNotifierProvider(create: (_) => UserScoreProvider())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login Screen ",
        home: MainPage(),
        initialRoute: '/',
        routes: {
          '/home': (ctx) => HomeScreen(),
          '/easy-mode': (ctx) => EasyMode(),
          '/medium-mode': (ctx) => MediumMode(),
          '/hard-mode': (ctx) => HardMode(),
          '/select-difficulty': (ctx) => SelectDifficulty(),
          '/login': (ctx) => LoginScreen(),
          '/sign-up': (ctx) => SignUpScreen(),
          '/settings': (ctx) => SettingScreen(),
          '/test-kim': (ctx) => TestKim(),
          '/congrats': (ctx) => Congrats(),
          '/practice-mode': (ctx) => PracticeMode(),
          '/learning-mode': (ctx) => LearningMode(),
          '/score-board': (ctx) => ScoreBoard(),

        },
      ),
    ),
  );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuestionChinaProvider>().initialD();
    });

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
