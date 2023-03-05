import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const violetTheme = Color(0xff9747FF);

    final borderRadius = BorderRadius.circular(38.4); // Image border

    return Container(
        padding: const EdgeInsets.all(4), // Border width
        decoration:
            BoxDecoration(color: violetTheme, borderRadius: borderRadius),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox.fromSize(
            size: const Size.fromRadius(40), // Image radius
            child: Image.asset(
              'assets/images/seki.png',

            ),
          ),
        ));
  }
}
