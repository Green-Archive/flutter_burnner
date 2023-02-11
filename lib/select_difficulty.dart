import 'package:flutter/material.dart';

class select_difficulty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:

        Column(
          children:[
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text("Back",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  )),
            ),

            Container(
              alignment: AlignmentDirectional.topCenter,
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text("Play",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  )),
            ),



          ]

        ),
      )

    );
  }
}