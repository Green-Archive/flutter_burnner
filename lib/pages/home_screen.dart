import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/theme_app.dart';
import '../components/normal_button.dart';
import '../components/user_profile.dart';

class HomeScreen extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;

  // Future<UserModel?> readUser() async{
  //   final docUser = FirebaseFirestore.instance.collection('users').doc(user.uid);
  //   final snapshot = await docUser.get();
  //
  //   if (snapshot.exists) {
  //     return UserModel.fromJson(snapshot.data()!);
  //   }
  //
  // }

  disPlayName()
  {
    if(user.isAnonymous == true)
    {
      return "Guest";
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
    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 60),
            Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisSize: MainAxisSize.max, children: [
                      Text(
                        'Hello, \n${
                            disPlayName()
                        }',
                        style: TextStyle(

                          fontFamily: 'Inter-Light',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]),
                    Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [UserProfile()]),
                  ],
                )),
            const SizedBox(height: 5),
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
                              'Competition', 1.5, 130, '/select-difficulty')
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NormalButton('Practice \n Mode', 3, 130, '/easy-play'),
                          NormalButton('Learning \n Content', 3, 130, '/easy-play')
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NormalButton('Topic', 3.5, 80, '/easy-play'),
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