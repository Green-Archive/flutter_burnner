import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burnner/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import '../components/theme_app.dart';
import '../components/normal_button.dart';
import '../components/user_profile.dart';
import '../providers/china_quest.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  disPlayName() {
    if (user.isAnonymous == true) {
      return "Guest";
    }

    if ((user.displayName) != "null" || user.displayName != null  ) {
      print("User : ${user.displayName}");
      // context.read<FirebaseAuth>().
      return user.displayName;
    }

    int? index = user.email?.indexOf('@');

    if (index != -1) {
      return user.email?.substring(0, index);
    } else {
      return user.email;
    }
  }

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<QuestionChinaProvider>().initialD();
    // });

    String userName = disPlayName();

    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 60),
            Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hello,",
                            style: TextStyle(
                              fontFamily: 'Inter-Light',
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                            )),
                        Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [UserProfile(photoUrl: user.photoURL)]),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(mainAxisSize: MainAxisSize.max, children: [
                          Text(
                            '${userName}',
                            style: TextStyle(
                              fontFamily: 'Inter-Light',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ]),

                        // Column(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [UserProfile(photoUrl: user.photoURL)]),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 36.0),
              child: const Text("Let's play",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(height: 60),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalButton(
                          'Competition', 1.5, 130, '/select-difficulty',
                          run: () {})
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NormalButton('Practice \n Mode', 3, 130, '/congrats'),
                      NormalButton('Test \n Content', 3, 130, '/test-kim')
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NormalButton('Topic', 3.5, 80, '/test-blank-page'),
                      NormalButton('Score', 3.5, 80, '/easy-play'),
                      NormalButton('Settings', 3.5, 80, '/settings')
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
