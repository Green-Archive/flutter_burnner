// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_burnner/select_difficulty.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 6.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3.0),
                          child: Image.asset(
                            'assets/images/seki.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )


                    ]),
                  ],
                )),
            const SizedBox(height: 5),
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text("Let's play",
                  style: TextStyle(
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 4.0,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 1.5,
                        padding: EdgeInsets.all(20.0),
                        height: 130,
                        // color: Colors.blue,
                        alignment: AlignmentDirectional.center,
                        child: GestureDetector(

                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        select_difficulty()));
                          },

                          child: Text('Play Compiation scores game',
                              textAlign: TextAlign.center,
                              // softWrap: true,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,

                                //  fontWeight: FontWeight.w500,
                              )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 4.0,
                          ),
                        ),

                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.all(20.0),
                        height: 120,
                        // height: MediaQuery.of(context).size.height / 5,
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


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 151, 71, 255),
                            width: 4.0,
                          ),
                        ),

                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.all(20.0),
                        height: 120,
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
        )),
      );
  }
}
