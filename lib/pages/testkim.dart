import 'package:flutter/cupertino.dart';
import 'package:flutter_burnner/layouts/default.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';


class testBlankPage extends StatelessWidget {
  const testBlankPage({Key? key}) : super(key: key);



  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

    return NormalLayout(
      body: [
        CountdownTimer(
          endTime: endTime,
          onEnd: onEnd,
        ),
      ],
    );
  }
}
