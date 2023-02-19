import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import '../components/oauth_button.dart';
import '../components/login_button.dart';
import '../components/login_button_2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    const violetTheme = const Color(0xff9747FF);

    const blueBackgroundColor = const Color(0xff32CEFF);
    const violetBackgroundColor = const Color(0xff8B62FF);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              blueBackgroundColor,
              violetBackgroundColor,
            ],
          )),
          child: Column(
            children: [
              const SizedBox(height: 145),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 151, 71, 255),
                    width: 6.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/logo_china.png',
                    //// width: MediaQuery.of(context).size.width / 3,
                    //// height: MediaQuery.of(context).size.width / 3,

                    width: 125,
                    height: 125,

                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60),
                           Text(
                            'Email',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: violetTheme,
                                width: 4.0,
                              ),
                            ),
                            child: const TextField(


                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(


                                contentPadding: EdgeInsets.all(20),
                                // border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: violetTheme,
                                width: 4.0,
                              ),
                            ),
                            child: const TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                // border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                // ContinueButton( MediaQuery.of(context).size.width / 4,inputText: 'KIM')
                                LoginButton("Log in",
                                    MediaQuery.of(context).size.width / 2.5),

                                const SizedBox(width: 10),
                                Expanded(
                                  child: LoginButton("Continue as guest", null),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              OauthButton('assets/images/google_2.png'),
                              SizedBox(width: 50),
                              OauthButton('assets/images/facebook_2.png'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
