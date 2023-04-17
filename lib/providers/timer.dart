import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burnner/pages/home_screen.dart';

class TimerCount with ChangeNotifier {

  late Timer _timer;
  int _start = 5;

  int get getTime => _start;


  void resetTime()
  {
    _start = 5;
  }

  void startTimer({required BuildContext context, required String mode, required int numQues}) {
    const oneSec =  Duration(seconds: 1);
    _timer =   Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
            timer.cancel();

            Navigator.pushReplacementNamed(context, "/congrats", arguments: {
              "mode": "Medium",
              "score": numQues,
            });


            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
            //   ModalRoute.withName('/'),
            // );

            // resetTime();
            notifyListeners();

        } else {
            _start--;
            notifyListeners();
        }
      },
    );
  }

}
