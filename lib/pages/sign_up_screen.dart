import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import '../components/login_text_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(height: 60),
          Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: BackToTheFuture()),
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
                  ])),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    LoginTextBox(
                        titleName: 'Email',
                        iconName: Icons.email,
                        textController: emailController),
                    const SizedBox(height: 25),
                    LoginTextBox(
                        titleName: 'Password',
                        iconName: Icons.lock,
                        textController: passwordController),
                    const SizedBox(height: 25),
                    LoginTextBox(
                        titleName: 'Confirm Password',
                        iconName: Icons.lock,
                        textController: confirmController),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // LoginButton("Sign Up", MediaQuery.of(context).size.width / 3.5),
                        buildButtonSignUp(
                          context: context,
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          ),
        ]),
      ),
    );
  }

  signUp() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmController.text.trim();
    if (password == confirmPassword && password.length >= 6) {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((authResult) {
        final user = authResult.user;

        //user.uid
        //user.email
        //await user?.updateDisplayName("Jane Q. User");
        //await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");


        print("Sign up user successful.");
      }).catchError((error) {
        print(error.message);
      });
    } else {
      print("Password and Confirm-password is not match.");
    }
  }

  Widget buildButtonSignUp({required BuildContext context}) {
    return InkWell(
      onTap: () {
        signUp();
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', ModalRoute.withName('/home'));
      },
      child: ThemeApp.loginButtonShape(
          context: context, textDisplay: 'Sign up', widthButton: 3.5),
    );
  }
}
