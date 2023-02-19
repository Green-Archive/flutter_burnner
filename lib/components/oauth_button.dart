import 'package:flutter/material.dart';
import '../pages/home_screen.dart';

class OauthButton extends StatelessWidget {
  final String pathImageFileName;

  const OauthButton(this.pathImageFileName, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const home_screen()));
      },
      child: Container(
        width: 64,
        height: 64,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pathImageFileName),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            )),

        // child:
      ),
    );
  }
}
