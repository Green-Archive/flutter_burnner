import 'package:flutter/material.dart';
import 'package:flutter_burnner/pages/select_difficulty.dart';

import '../components/normal_button.dart';
import '../components/user_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const violetTheme = Color(0xff9747FF);

    const blueBackgroundColor = Color(0xff32CEFF);
    const violetBackgroundColor = Color(0xff8B62FF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            blueBackgroundColor,
            violetBackgroundColor,
          ],
        )),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 50),
            Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisSize: MainAxisSize.max, children: [
                      Text(
                        'Hello, Mr.guset',
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
                    fontFamily: 'Poppins',
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
                      NormalButton('Competition',1.5,'/easy-play')
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NormalButton('Practice \n Mode',3,'/easy-play')
                      ,
                      NormalButton('Learning \n Content',3,'/easy-play')
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 4.0,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 3.5,
                        padding: EdgeInsets.all(20.0),
                        height: 80,
                        alignment: AlignmentDirectional.center,
                        child: Text('topic',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              //  fontWeight: FontWeight.w500,
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 4.0,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 3.5,
                        padding: EdgeInsets.all(20.0),
                        height: 80,
                        alignment: AlignmentDirectional.center,
                        child: Text('score',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              //  fontWeight: FontWeight.w500,
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 4.0,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 3.5,
                        padding: EdgeInsets.all(20.0),
                        height: 80,
                        alignment: AlignmentDirectional.center,
                        child: Text('settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              //  fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
