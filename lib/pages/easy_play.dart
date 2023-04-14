import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/showSnackbar.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:flutter_burnner/pages/home_screen.dart';
import 'package:flutter_burnner/providers/china_quest.dart';
import 'package:flutter_burnner/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import '../models/china_characters.dart';
import '../providers/heart.dart';

class EasyPlay extends StatefulWidget {
  EasyPlay({super.key});

  @override
  _EasyPlayState createState() => _EasyPlayState();
}

class _EasyPlayState extends State<EasyPlay> {
  late List<ChinaCharacters> chiQues;

  late ChinaCharacters wrongOne;

  int numQues = 0;

  @override
  void initState() {
    chiQues = context.read<QuestionChinaProvider>().getRandom10;
    context.read<Heart>().startHeart(3);
    wrongOne = context.read<QuestionChinaProvider>().getRandom1;

    while (wrongOne.character == chiQues[numQues].character) {
      wrongOne = context.read<QuestionChinaProvider>().getRandom1;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget correctChoice = ThemeApp.NomalButtonShape(
        context: context,
        widthButton: 1.2,
        heightButton: 110,
        textDisplay: '${chiQues[numQues].eng_meaning}',
        run: () {
          setState(() {
            do {
              wrongOne = context.read<QuestionChinaProvider>().getRandom1;
            } while (wrongOne.character == chiQues[numQues].character);

            if (numQues < chiQues.length - 1) {
              numQues++;
            } else {
              // Navigator.pushNamedAndRemoveUntil(context, '/congrats', (Route<dynamic> route) => false);
              Navigator.pushReplacementNamed(context, "/congrats", arguments: {
                "mode": "EZ",
                "score": numQues,
              });
            }

            showSnackBar(context, "Good");
          });
        });

    Widget wrongChoice_1 = ThemeApp.NomalButtonShape(
        context: context,
        widthButton: 1.2,
        heightButton: 110,
        textDisplay: '${wrongOne.eng_meaning}',
        run: () {
          setState(() {

            do {
              wrongOne = context.read<QuestionChinaProvider>().getRandom1;
            } while (wrongOne.character == chiQues[numQues].character);

            if (numQues < chiQues.length - 1) numQues++;
            showSnackBar(context, "Wrong");
            context.read<Heart>().decrease();

            if (context.read<Heart>().getHeart == 0) {
              Navigator.pushReplacementNamed(context, "/congrats", arguments: {
                "mode": "EZ",
                "score": numQues,
              });
            }
          });
        });

    List<Widget> questions = [
      correctChoice,
      wrongChoice_1,
    ];
    questions.shuffle();

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: BackToTheFuture()),
                  // Container(
                  //     child: Center(
                  //         child: Text("${numQues + 1}/${chiQues.length}",
                  //             style: TextStyle(
                  //               fontSize: 30,
                  //               fontWeight: FontWeight.w800,
                  //             )))),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red[600],
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        HeartRemain(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '${chiQues[numQues].character}',
                style: TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[800]),
              ),
            ),
            const SizedBox(height: 30),
            Text('what is this character',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 30),
            questions[0],
            const SizedBox(height: 15),
            questions[1],
          ],
        ),
      ),
    );
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

class HeartRemain extends StatelessWidget {
  const HeartRemain({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Heart>().getHeart}',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ));
  }
}

// class numQuesEnd extends StatelessWidget {
//   const numQuesEnd({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('${chiQues.length}',
//         style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.w800,
//         ));
//   }
