import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/china_characters.dart';

class QuestionChinaProvider with ChangeNotifier {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<ChinaCharacters> myList = [];

  String _stringSomething = 'strat';

  List<ChinaCharacters> get getChina => myList;

  void initialD()  {

    _db.collection("chinese_words").withConverter(
          fromFirestore: ChinaCharacters.fromFirestore,
          toFirestore: (ChinaCharacters chinaCharacters, _) =>
              chinaCharacters.toFirestore(),
        ).get()
    .then((QuerySnapshot<ChinaCharacters> querySnapshot)
    {
      if (querySnapshot.docs.isNotEmpty) {
        for (var docSnapshot in querySnapshot.docs) {
          myList.add(docSnapshot.data());
        }
          print("Succ Provider China.");
          notifyListeners();
      } else {
        print("No such document.");
        notifyListeners();
      }
    }
    )

    ;
  }
}
