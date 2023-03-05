import 'package:flutter/material.dart';
import 'package:flutter_burnner/pages/select_difficulty.dart';

class EasyPlay extends StatelessWidget {
  const EasyPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Container(
                  child: const Text("Logo",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              // DividerExample(),

              Container(
                alignment: Alignment.center,
                child: Text(
                  '天',

                  style: TextStyle(
                      fontSize: 150,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[800]

                  ),
                ),
              ),

            ],
          ),
          const SizedBox(height:33),

          Text('what is this character',
          style: TextStyle(
              fontSize: 25,
            fontWeight: FontWeight.w400,
          )
          ),

          const SizedBox(height:30),


          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45.0),
              border: Border.all(
                color: Color.fromARGB(255, 151, 71, 255),
                width: 4.0,
              ),
            ),
            width: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.all(20.0),
            height: 110,
            // color: Colors.blue,
            alignment: AlignmentDirectional.center,
            child: Text('choice1',
                textAlign: TextAlign.center,
                // softWrap: true,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,

                  //  fontWeight: FontWeight.w500,
                )),
          ),

          const SizedBox(height:15),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45.0),
              border: Border.all(
                color: Color.fromARGB(255, 151, 71, 255),
                width: 4.0,
              ),
            ),
            width: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.all(20.0),
            height: 110,
            alignment: AlignmentDirectional.center,
            child: Text('choice2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                )),
          )

        ],
      ),
    ));
  }
}

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {

    Divider divider = Divider(
      height: 20,
      thickness: 4,
      indent: 0,
      endIndent: 0,
      color: Colors.lightBlueAccent[100],
    );

    return Padding(
      padding: const EdgeInsets.only(
        left: 60.0,
        right: 60.0,
      ),
      child: Column(
        children: [
          SizedBox(height: 41.0),
          divider,
          SizedBox(height: 25.0),
          divider,
          SizedBox(height: 25.0),
          divider,
          SizedBox(height: 25.0),
          divider,
        ],
      ),
    );
  }
}
