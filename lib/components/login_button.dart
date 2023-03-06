import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginButton extends StatelessWidget {
  final String textDisplay;
  final double? widthButton;
  final String routeScreen;

  const LoginButton({super.key,required this.textDisplay,this.widthButton,required, required this.routeScreen,});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeScreen);
        },
      child: ThemeApp.loginButtonShape(context:context,widthButton: widthButton, textDisplay: textDisplay),
    );
  }

}

class TextDisplay extends StatelessWidget {
  const TextDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
