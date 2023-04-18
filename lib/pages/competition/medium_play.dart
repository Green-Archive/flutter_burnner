import 'package:flutter/material.dart';
import 'package:flutter_burnner/layouts/default.dart';
import 'package:flutter_burnner/components/showSnackbar.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:flutter_burnner/pages/home_screen.dart';
import 'package:flutter_burnner/providers/china_quest.dart';
import 'package:flutter_burnner/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import '../../models/china_characters.dart';
import '../../providers/heart.dart';
import '../../providers/timer.dart';

class MediumPlay extends StatefulWidget {
  MediumPlay({super.key});

  @override
  _MediumPlayState createState() => _MediumPlayState();
}

class _MediumPlayState extends State<MediumPlay> {
  late List<ChinaCharacters> chiQues;

  late ChinaCharacters wrongOne;

  int numQues = 0;

  int score = 0;

  @override
  void initState() {


    chiQues = context.read<QuestionChinaProvider>().getRandom10;
    context.read<Heart>().startHeart(3);
    wrongOne = context.read<QuestionChinaProvider>().getRandom1;

    while (wrongOne.character == chiQues[numQues].character) {
      wrongOne = context.read<QuestionChinaProvider>().getRandom1;
    }

    context.read<TimerCount>().startTimer(context :context, score:score, mode: "Medium", setTimeSecond: 20);
    super.initState();
  }

  void navigateToCongrats() {
    Navigator.pushReplacementNamed(context, "/congrats", arguments: {
      "mode": "Medium",
      "score": score,
    });
  }

  void correctClick() {
    context.read<TimerCount>().resetTime();
    score++;
    showSnackBar(context, "Good");

    if (numQues < chiQues.length - 1) {
      numQues++;

      do {
        wrongOne = context.read<QuestionChinaProvider>().getRandom1;
      } while (wrongOne.character == chiQues[numQues].character);
    } else {
      navigateToCongrats();
    }
  }

  void wrongCLick() {
    context.read<TimerCount>().resetTime();
    showSnackBar(context, "Wrong");
    context.read<Heart>().decrease();

    if (context.read<Heart>().getHeart == 0) navigateToCongrats();

    if (numQues < chiQues.length - 1) {
      numQues++;
      do {
        wrongOne = context.read<QuestionChinaProvider>().getRandom1;
      } while (wrongOne.character == chiQues[numQues].character);
    } else {
      navigateToCongrats();
    }
  }

  List<Widget> heartIcon() {
    return [Icon(
      Icons.favorite,
      color: Colors.red[600],
      size: 30,

    ),const SizedBox(
      width: 15,
    ),];
  }

  Widget showLimit() {
    return Center(
        child: Text("${numQues + 1}/${chiQues.length}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget correctChoice = ThemeApp.NomalButtonShape(
        context: context,
        widthButton: 1.2,
        heightButton: 110,
        textDisplay: '✔️${chiQues[numQues].eng_meaning}',
        run: () => setState(() => correctClick()));

    Widget wrongChoice_1 = ThemeApp.NomalButtonShape(
        context: context,
        widthButton: 1.2,
        heightButton: 110,
        textDisplay: '❌ ${wrongOne.eng_meaning}',
        run: () => setState(() => wrongCLick()));

    List<Widget> questions = [
      correctChoice,
      wrongChoice_1,
    ];

    questions.shuffle();

    return NormalLayout(
      head: [
        Expanded(child: BackToTheFuture(run: () {
          context.read<TimerCount>().cancelTime();
        },)),
        TimeMy(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ...heartIcon(),
              const HeartRemain(),
            ],
          ),
        ),
      ],
      betweenHeadAndBody: 0,
      body: [
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
        const Text('what is this character',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(height: 30),
        questions[0],
        const SizedBox(height: 15),
        questions[1],
      ],
    );
  }
}

class HeartRemain extends StatelessWidget {
  const HeartRemain({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Heart>().getHeart}',
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ));
  }
}

class TimeMy extends StatelessWidget {


  const TimeMy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<TimerCount>().getTime}',
        style:  const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ));
  }
}