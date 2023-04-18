import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burnner/layouts/default.dart';
import 'package:flutter_burnner/models/users_score.dart';
import 'package:provider/provider.dart';

import '../components/theme_app.dart';
import '../components/user_profile.dart';
import '../providers/users_score_load.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    context.read<UserScoreProvider>().initialD();

    final allUsers = context.read<UserScoreProvider>().getUsers;

    List<Widget> allUsersDisplay = [];

    allUsers.forEach((user) {

      allUsersDisplay.add(
          Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [UserProfile(photoUrl: user.photoURL ?? null)],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.fullName!,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),),
                      const SizedBox(height: 5),
                      Text("Best Score ${user.score}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,)
            ],
          )
      );


    });

    return NormalLayout(
        head: [
          const Expanded(child: BackToTheFuture()),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            alignment: AlignmentDirectional.center,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Text(" Score Board Hard Mode ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ))
            ),
          ),
          Expanded(child: Container())
        ],
            body: [
              Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [...allUsersDisplay],
              )
              )
      ],

    );
  }
}

