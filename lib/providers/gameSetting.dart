import 'package:flutter/material.dart';

class GameSetting with ChangeNotifier {
  //최소 변경
  int _maxPoint = 5;
  int _maxScore = 1;

  int get getPoint => _maxPoint;
  int get getScore => _maxScore;

  void increMaxPoint() {
    if (_maxPoint < 25) {
      _maxPoint++;
    } else {
      _maxPoint = 5;
    }
    notifyListeners();
  }

  void decreMaxPoint() {
    if (_maxPoint > 5) {
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
      _maxScore = 1;
    }
    notifyListeners();
  }

  void decreMaxScore() {
    if (_maxScore > 1) {
      _maxScore--;
    } else {
      _maxScore = 5;
    }
    notifyListeners();
  }

  void resetAll() {
    _maxPoint = 5;
    _maxScore = 1;
    notifyListeners();
  }
}
