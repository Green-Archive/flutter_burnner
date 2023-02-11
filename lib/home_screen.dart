// TODO Implement this library.
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]),
                    Column(mainAxisSize: MainAxisSize.max, children: [
                      Image.asset(
                        'assets/images/flutter.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      )
                    ]),
                  ],
                )),

            const SizedBox(height: 5),

            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text('Let' 's play',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.all(20.0),
                  height: 100,
                  color: Colors.blue,
                  alignment: AlignmentDirectional.center,
                  child: Text('Play Compiation scores game',
                      textAlign: TextAlign.center,
                      // softWrap: true,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,

                        //  fontWeight: FontWeight.w500,
                      )),
                )
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  padding: EdgeInsets.all(20.0),
                  height: 100,
                  // height: MediaQuery.of(context).size.height / 5,
                  color: Colors.blue,
                  alignment: AlignmentDirectional.center,
                  child: Text('เล่นเฉยๆไม่ได้คะแนน',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        //  fontWeight: FontWeight.w500,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(20.0),
                  height: 100,
                  color: Colors.blue,
                  alignment: AlignmentDirectional.center,
                  child: Text('เนื้อหาไว้สอน',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        //  fontWeight: FontWeight.w500,
                      )),
                )
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
                  width: MediaQuery.of(context).size.width / 4,
                  padding: EdgeInsets.all(20.0),
                  height: 100,
                  color: Colors.blue,
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
                  width: MediaQuery.of(context).size.width / 4,
                  padding: EdgeInsets.all(20.0),
                  height: 100,
                  color: Colors.blue,
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
                  width: MediaQuery.of(context).size.width / 4,
                  padding: EdgeInsets.all(20.0),
                  height: 100,
                  color: Colors.blue,
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
        )),
      )),
    );
  }
}
