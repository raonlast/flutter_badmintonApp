import 'package:flutter/material.dart';

class GameCounter with ChangeNotifier {
  int _leftPoint = 0;
  int _leftScore = 0;
  int _rightPoint = 0;
  int _rightScore = 0;

  int get getLeftPoint => _leftPoint;
  int get getLeftScore => _leftScore;
  int get getRightPoint => _rightPoint;
  int get getRightScore => _rightScore;

  void increPoint(String team) {
    if (team == "left") {
      _leftPoint++;
    } else if (team == "right") {
      _rightPoint++;
    }
    notifyListeners();
  }

  void decrePoint(String team) {
    if (team == "left") {
      _leftPoint--;
    } else if (team == "right") {
      _rightPoint--;
    }
    notifyListeners();
  }

  void increScore(String team) {
    if (team == "left") {
      _leftScore++;
    } else if (team == "right") {
      _rightScore++;
    }
    notifyListeners();
  }

  void decreScore(String team) {
    if (team == "left") {
      _leftScore--;
    } else if (team == "right") {
      _rightScore--;
    }
    notifyListeners();
  }

  void resetAll() {
    _leftPoint = 0;
    _leftScore = 0;
    _rightPoint = 0;
    _rightScore = 0;
    // notifyListeners();
  }

  void overPoint(String team) {
    if (team == "left") {
      _leftPoint = 0;
      _leftScore++;
    } else if (team == "right") {
      _rightPoint = 0;
      _rightScore++;
    }
    notifyListeners();
  }

  void underPoint (int maxPoint, String team) {
    if (team == "left") {
      _leftPoint = maxPoint;
    } else if (team == "right") {
      _rightPoint = maxPoint;
    }
  }

  void underScore (int maxScore, String team) {
    if (team == "left") {
      _leftScore = 0;
    } else if (team == "right") {
      _rightScore = 0;
    }
  }

}
