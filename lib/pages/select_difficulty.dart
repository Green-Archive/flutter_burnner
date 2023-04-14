import 'package:flutter_burnner/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/normal_button.dart';
import '../components/theme_app.dart';

class SelectDifficulty extends StatelessWidget {
  const SelectDifficulty({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) {
    //
    //   Future.delayed(Duration.zero, () {
    //     context.read<CounterStrike>().increase();
    //   });
    //
    // });

    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: BackToTheFuture()),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  alignment: AlignmentDirectional.center,
                  child: Text("Competition",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Expanded(child: Container())
              ],
            ),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(90.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 151, 71, 255),
                    width: 4.0,
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.7,
                padding: EdgeInsets.all(20.0),
                height: 175,
                alignment: AlignmentDirectional.center,
                child: Text('Illustration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
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
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalButton('Easy', 1.5, 100, '/easy-play'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalButton('Medium', 1.5, 100, '/medium-play'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalButton('Hard', 1.5, 100, '/easy-play'),
            ],
          ),
        ]),
      ),
    );
  }
}
