import 'package:flutter/material.dart';
import 'package:flutter_burnner/components/theme_app.dart';
import 'package:flutter_burnner/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import '../providers/heart.dart';

class EasyPlay extends StatefulWidget {
  EasyPlay({super.key});

  @override
  _EasyPlayState createState() => _EasyPlayState();
}

class _EasyPlayState extends State<EasyPlay> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<Heart>().startHeart(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ThemeApp.background(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: BackToTheFuture()),
                  Container(
                      child: Center(
                          child: Text('1/3',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              )))),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red[600],
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        HeartRemain(),
                      ],
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
            InkWell(
              onTap: () {},
              child: ThemeApp.NomalButtonShape(
                  context: context,
                  widthButton: 1.2,
                  heightButton: 110,
                  textDisplay: 'choice1'),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: ThemeApp.NomalButtonShape(
                  context: context,
                  widthButton: 1.2,
                  heightButton: 110,
                  textDisplay: 'choice2'),
            )
          ],
        ),
      ),
    );
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

class HeartRemain extends StatelessWidget {
  const HeartRemain({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Heart>().getHeart}',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ));
  }
}
