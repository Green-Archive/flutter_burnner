import 'package:flutter/material.dart';

class ThemeApp {

  static const violetTheme = Color(0xff9747FF);

  BoxDecoration background() {
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