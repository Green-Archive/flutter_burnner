import 'package:flutter/material.dart';

import '../components/theme-app.dart';
import 'easy_play.dart';

class SelectDifficulty extends StatelessWidget {
  const SelectDifficulty({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: ThemeApp().background(),
        child: Column(children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 25.0, top: 35.0),
              child: Icon(Icons.arrow_back_ios,size: 35.0,),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topCenter,
            padding: const EdgeInsets.only(left: 10.0),
            child: const Text("Play",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 151, 71, 255),
                    width: 4.0,
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.5,
                padding: EdgeInsets.all(20.0),
                height: 150,
                alignment: AlignmentDirectional.center,
                child: Text('Some image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('select difficulty',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
          const SizedBox(height: 30),
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
                height: 100,
                // color: Colors.blue,
                alignment: AlignmentDirectional.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EasyPlay()));
                  },
                  child: Text('Easy',
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
          const SizedBox(height: 10),
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
                height: 100,
                // color: Colors.blue,
                alignment: AlignmentDirectional.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EasyPlay()));
                  },
                  child: Text('Medium',
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
          const SizedBox(height: 10),
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
                height: 100,
                // color: Colors.blue,
                alignment: AlignmentDirectional.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EasyPlay()));
                  },
                  child: Text('Hard',
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
        ]),
      ),
    ));
  }
}
