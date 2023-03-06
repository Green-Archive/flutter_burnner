import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/login_text_box.dart';
import '../components/theme_app.dart';
import '../components/oauth_button.dart';
import '../components/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const LogoOtter(),
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
                      const SizedBox(height: 35),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            // ContinueButton( MediaQuery.of(context).size.width / 4,inputText: 'KIM')
                            LoginButton(
                                textDisplay: "Log in",
                                widthButton: 3.5,
                                routeScreen: '/home'),

                            const SizedBox(width: 10),
                            Expanded(
                              child: LoginButton(
                                  textDisplay: "Continue as guest",
                                  routeScreen: '/home'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          OauthButton('assets/images/google_2.png'),
                        ],
                      ),
                      const SizedBox(height: 34),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                textAlign: TextAlign.center,
                                "Need an account ?",
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
                                Navigator.pushNamed(context, '/sign-up');
                              },
                              child: Text(
                                  textAlign: TextAlign.center,
                                  "Sign Up",
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
            )
          ],
        ),
      ),
    );
  }
}

class LogoOtter extends StatelessWidget {
  const LogoOtter({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15); // Image border

    return Container(
        padding: const EdgeInsets.all(6), // Border width
        decoration: BoxDecoration(
            color: ThemeApp.violetTheme, borderRadius: borderRadius),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox.fromSize(
            size: const Size.fromRadius(60), // Image radius
            child: Image.asset(
              'assets/images/seki.png',
            ),
          ),
        ));
  }
}
