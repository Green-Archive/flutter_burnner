import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/normal_button.dart';
import 'package:flutter_burnner/components/theme_app.dart';

class EasyPlay extends StatelessWidget {
  const EasyPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackToTheFuture(),
                  Container(

                    width: MediaQuery.of(context).size.width / 1.8,
                    alignment: AlignmentDirectional.center,
                    child: Text("Competition",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Expanded(
                    child: Container(

                      child: Icon(Icons.heart_broken
                      ,size: 50,),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '天',
                style: TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[800]),
              ),
            ),
            const SizedBox(height: 30),
            Text('what is this character',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 30),
            NormalButton('choice1', 1.2, 110, '/select-difficulty'),

            const SizedBox(height: 15),
            NormalButton('choice2', 1.2, 110, '/select-difficulty'),

          ],
        ),
      ),
    ));
  }
}

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    Divider divider = Divider(
      height: 20,
      thickness: 4,
      indent: 0,
      endIndent: 0,
      color: Colors.lightBlueAccent[100],
    );

    return Padding(
      padding: const EdgeInsets.only(
        left: 60.0,
        right: 60.0,
      ),
      child: Column(
        children: [
          SizedBox(height: 41.0),
          divider,
          SizedBox(height: 25.0),
          divider,
          SizedBox(height: 25.0),
          divider,
          SizedBox(height: 25.0),
          divider,
        ],
      ),
    );
  }
}
