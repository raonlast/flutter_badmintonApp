import 'package:flutter/material.dart';

class GameSetting with ChangeNotifier {
  int _maxPoint = 0;
  int _maxScore = 0;

  int get getPoint => _maxPoint;
  int get getScore => _maxScore;

  void increMaxPoint() {
    if (_maxPoint < 25) {
      _maxPoint++;
    } else {
      _maxPoint = 0;
    }
    notifyListeners();
  }

  void decreMaxPoint() {
    if (_maxPoint > 0) {
      _maxPoint--;
    } else {
      _maxPoint = 25;
    }
    notifyListeners();
  }

  void increMaxScore() {
    if (_maxScore < 5) {
      _maxScore++;
    } else {
      _maxScore = 0;
    }
    notifyListeners();
  }

  void decreMaxScore() {
    if (_maxScore > 0) {
      _maxScore--;
    } else {
      _maxScore = 5;
    }
    notifyListeners();
  }
}
