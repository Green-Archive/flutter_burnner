import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/china_characters.dart';




class QuestionChinaProvider with ChangeNotifier {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String _stringSomething = 'strat';
  List<ChinaCharacters> myList = [];

  String? get getChina => myList.first.character;



  Future<void> InitialD () async {

    final ref =  _db.collection("chinese_words").withConverter(
    fromFirestore: ChinaCharacters.fromFirestore,
    toFirestore: (ChinaCharacters chinaCharacters, _) => chinaCharacters.toFirestore(),
  );
  final querySnapshot = await ref.get();
  // final chinaCharacters = docSnap.data(); // Convert to City object

    for (var docSnapshot in querySnapshot.docs) {
      myList.add(docSnapshot.data());
    }
  }


  // if (chinaCharacters != null) {
  //   print(chinaCharacters.character);
  // } else {
  //   print("No such document.");
  // }

  notifyListeners();

  }

