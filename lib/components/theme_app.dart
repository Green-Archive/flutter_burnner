import 'package:flutter/material.dart';

class ThemeApp {

  static const violetTheme = Color(0xff9747FF);

  static BoxDecoration  background() {
    const blueBackgroundColor = Color(0xff32CEFF);
    const violetBackgroundColor = Color(0xff8B62FF);
    return const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            blueBackgroundColor,
            violetBackgroundColor,
          ],
        ));
  }

}

class BackToTheFuture extends StatelessWidget {
  const BackToTheFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: AlignmentDirectional.topStart,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 35.0,
            )),
      ),
    );
  }
}
