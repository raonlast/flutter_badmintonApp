import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/db.dart';
import 'package:sqflite/sqflite.dart';

class GameCounter with ChangeNotifier {
  int _leftPoint = 0;
  int _leftScore = 0;
  int _rightPoint = 0;
  int _rightScore = 0;
  // var _nowDate = DateTime.now().toString();
  bool timerState = true;
  // var end_time = DateTime.now().toString();
  int currentDay = DateTime.now().day;
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  int get getLeftPoint => _leftPoint;
  int get getLeftScore => _leftScore;
  int get getRightPoint => _rightPoint;
  int get getRightScore => _rightScore;

  void saveData(String minutes, String seconds) async {
    Score result = Score(
      leftScore: _leftScore,
      rightScore: _rightScore,
      minutes: minutes,
      seconds: seconds,
      day: currentDay,
      month: currentMonth,
      year: currentYear,
    );
    // List<Score> listOfScore = [result];
    // return await DB_Helper().insertScore(listOfScore);
    // print("saveDataProvider : $result");
    await DB_Helper().insertScore(result);
  }

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
      if (_leftPoint == 0) {}
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

  void resetPoint() {
    _leftPoint = 0;
    _rightPoint = 0;
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
      increScore(team);
    } else if (team == "right") {
      _rightPoint = 0;
      increScore(team);
    }
    notifyListeners();
  }

  void clearPoint(String team) {
    if (team == "left") {
      _leftPoint = 0;
    } else if (team == "right") {
      _rightPoint = 0;
    }
    notifyListeners();
  }

  void underPoint(int maxPoint, String team) {
    if (team == "left") {
      _leftPoint = maxPoint;
    } else if (team == "right") {
      _rightPoint = maxPoint;
    }
    notifyListeners();
  }

  void underScore(int maxScore, String team) {
    if (team == "left") {
      _leftScore = 0;
    } else if (team == "right") {
      _rightScore = 0;
    }
    notifyListeners();
  }
}

// Future<Database> 
