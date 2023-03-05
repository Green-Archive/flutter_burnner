import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/login_button.dart';
import '../components/oauth_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
            children:[
              SizedBox(height: 60),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BackToTheFuture(),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          alignment: AlignmentDirectional.center,
                          child: Text("Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                        Expanded(child: Container())
                      ]

              )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      LoginTextBox(titleName: 'Email', iconName: Icons.email),
                      const SizedBox(height: 25),
                      LoginTextBox(
                        titleName: 'Password',
                        iconName: Icons.lock,
                      ),
                      const SizedBox(height: 25),
                      LoginTextBox(
                        titleName: 'Confirm Password',
                        iconName: Icons.lock,
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ContinueButton( MediaQuery.of(context).size.width / 4,inputText: 'KIM')
                          LoginButton("Sign Up",
                              MediaQuery.of(context).size.width / 3.5),
                        ],
                      ),
                      const SizedBox(height: 34),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                textAlign: TextAlign.center,
                                "  already have an account ?",
                                style: GoogleFonts.inter(
                                  shadows: [
                                    const Shadow(
                                      offset: Offset(0.0, 4.0),
                                      blurRadius: 6.0,
                                      color: Color.fromARGB(63, 0, 0, 0),
                                    )
                                  ],
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                  textAlign: TextAlign.center,
                                  "Log In",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ])
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}