import 'package:flutter/material.dart';

import '../models/china_characters.dart';

class QuestionChinaProvider with ChangeNotifier {
  List<ChinaCharacters> chinaCharacters = [
    ChinaCharacters(character: '今', correct: 'Now', wrong: 'Tomorrow'),
    ChinaCharacters(character: '当', correct: 'To be', wrong: 'Secretary'),
    ChinaCharacters(character: '类', correct: 'Type', wrong: 'Manager'),
  ];

  List<ChinaCharacters> getQuestionChina() {
    return chinaCharacters;
  }
}
