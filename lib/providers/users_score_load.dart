import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_burnner/models/users_score.dart';

import '../models/china_characters.dart';

class UserScoreProvider with ChangeNotifier {
  bool check_input_yet = true;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<UserScore> allUsers = [];

  List<UserScore> get getUsers => allUsers;

  void initialD() {
    if (check_input_yet == true) {
      _db
          .collection("users")
          .withConverter(
            fromFirestore: UserScore.fromFirestore,
            toFirestore: (UserScore users, _) =>
                users.toFirestore(),
          )
          .get()
          .then((QuerySnapshot<UserScore> querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          for (var docSnapshot in querySnapshot.docs) {
            allUsers.add(docSnapshot.data());
          }
          print("Succ Provider Users.");
          print(allUsers.length);
          check_input_yet = false;
          notifyListeners();
        } else {
          print("No such document.");
          notifyListeners();
        }
      }).catchError((err) {
        print("allUsers Error : ${err}");
      });
    } else {
      print("input again?");
    }
  }
}
