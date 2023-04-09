import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/showSnackbar.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import '../components/login_text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController usernameController = TextEditingController();
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
                        titleName: 'Username',
                        iconName: Icons.person,
                        textController: usernameController),
                    const SizedBox(height: 25),
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

  Future signUp(BuildContext context) async {
    try {
      String username = usernameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmController.text.trim();

      if (username == '') {
        showSnackBar(context, "Password and Confirm-password is not match.");
        throw ('User is null');
      }

      if (password != confirmPassword) {
        showSnackBar(context, "Password and Confirm-password is not match.");
        throw ("Password and Confirm-password is not match.");
      }

      final UserCredential authResult = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = authResult.user;

      final db = FirebaseFirestore.instance;

      if (user == null) {
        throw ('User is null');
      }

      db.collection("users").doc(username).set({
        "username": username,
        "uid": user.uid,
        "email": user.email
      }).then((value) {
        Navigator.pushNamedAndRemoveUntil(
                context, '/login', ModalRoute.withName('/home'))
            .then((value) => null);
      }).catchError((e) {
        print("Error : ${e}");
        showSnackBar(
            context, "db error"); // Displaying the usual firebase error message
      });

      //user.uid
      //user.email
      //await user?.updateDisplayName("Jane Q. User");
      //await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
      // });
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }

  Widget buildButtonSignUp({required BuildContext context}) {
    return InkWell(
      onTap: () {
        signUp(context);
      },
      child: ThemeApp.loginButtonShape(
          context: context, textDisplay: 'Sign up', widthButton: 3.5),
    );
  }
}
