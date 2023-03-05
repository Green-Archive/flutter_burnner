import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalButton extends StatelessWidget {
  final String textDisplay;
  final double widthButton;
  final String routeScreen;

  // const NormalButton({super.key});
  const NormalButton(this.textDisplay, this.widthButton, this.routeScreen,
      {super.key});

  @override
  Widget build(BuildContext context) {
    const violetTheme = Color(0xff9747FF);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45.0),
          border: Border.all(
            color: violetTheme,
            width: 4.0,
          ),
        ),
        width: MediaQuery.of(context).size.width / widthButton,
        padding: EdgeInsets.all(20.0),
        height: 130,
        // color: Colors.blue,
        alignment: AlignmentDirectional.center,
        child: TextDisplay(textDisplay),
      ),
    );
  }
}

class TextDisplay extends StatelessWidget {
  final String? textDisplay;

  const TextDisplay(this.textDisplay, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${textDisplay}',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.8)));
  }
}
