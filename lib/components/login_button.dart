import 'package:flutter/material.dart';
import '../pages/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginButton extends StatelessWidget {
  final String? textDisplay;
  final double? widthButton;

  const LoginButton(this.textDisplay, this.widthButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const home_screen()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xff9747FF),
              width: 4.0,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: Text(
                // softWrap: true,
                textAlign: TextAlign.center,
                '${textDisplay}',
                style:  GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
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
