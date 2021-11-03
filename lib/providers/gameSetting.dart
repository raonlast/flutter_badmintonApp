import 'package:flutter/material.dart';

class GameSetting with ChangeNotifier {
  int _maxPoint = 0;
  int _maxScore = 0;

  int get getPoint => _maxPoint;
  int get getScore => _maxScore;

  void updateMaxPoint(int value) {
    _maxPoint = value;
    notifyListeners();
  }

  void updateMaxScore(int value) {
    _maxScore = value;
    notifyListeners();
  }
}
