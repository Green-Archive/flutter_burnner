import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/normalLayout.dart';
import '../components/theme_app.dart';

class Congrats extends StatelessWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

     return NormalLayout(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/trophy.png',
              height: 300,
            ),
            SizedBox(
              height: 50,
            ),
            Text("Congratulation!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 50,
            ),
            Text(
              textAlign: TextAlign.center,
              "you finished \nmode ${arguments?['mode'] ?? 'Mode Something'} \nwith ${arguments?['score'] ?? '-1'}",
              style: TextStyle(
                fontFamily: 'Inter-Light',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                // Navigator.popUntil(context, ModalRoute.withName('/home'));
                // Navigator.pushNamedAndRemoveUntil(context, '/congrats', ModalRoute.withName('/home'));
                // Navigator.pushReplacementNamed(context, "/");
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (Route<dynamic> route) => false);
                // Navigator.pop(context);
              },
              child: Text("Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
