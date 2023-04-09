import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/showSnackbar.dart';
import '../components/theme_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestKim extends StatelessWidget {
  const TestKim({Key? key}) : super(key: key);

  Future testAdd(BuildContext context) async {
    final docUser = FirebaseFirestore.instance.collection("test-kim");

    final json = {'test_1': "comfy time", 'test_2': "Pastel"};

    await docUser
        .add(json)
        .then((value) => showSnackBar(context, "test-kim Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            SizedBox(height: 60),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: BackToTheFuture()),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  alignment: AlignmentDirectional.center,
                  child: Text("Test",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                Expanded(child: Container())
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                showSnackBar(context, "test");
              },
              child: testButton(
                  titleName: "Test onTap show SnackBar",
                  iconName: Icons.telegram),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                testAdd(context);
              },
              child:
                  testButton(titleName: "Kim", iconName: Icons.perm_identity),
            ),
          ]),
        ),
      ),
    );
  }

  testButton({required String titleName, required IconData iconName}) {
    return Row(
      children: [
        Icon(
          iconName,
          size: 40,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Text('${titleName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              )),
        )
      ],
    );
  }
}
