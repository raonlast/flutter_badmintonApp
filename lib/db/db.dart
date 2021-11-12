import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Score {
  int leftScore;
  int rightScore;
  String minutes;
  String seconds;

  Score({
    required this.leftScore,
    required this.rightScore,
    required this.minutes,
    required this.seconds,
  });

  Map<String, Object?> toMap() {
    return {
      'leftScore': leftScore,
      'rightScore': rightScore,
      'minutes': minutes,
      'seconds': seconds,
    };
  }

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return 'leftScore: $leftScore, rightScore: $rightScore, minutes: $minutes, seconds: $seconds';
  // }
  // Score.fromMap(Map<String, dynamic> res)
  //     : leftScore = res['leftScore'],
  //       rightScore = res['rightScore'],
  //       minutes = res['minutes'],
  //       seconds = res['seconds'];

  // Map<String, Object?> toMap() {
  //   return {
  //     'leftScore': leftScore,
  //     'rightScore': rightScore,
  //     'minutes': minutes,
  //     'seconds': seconds
  //   };
  // }

}

class DB_Helper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'score.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE score(id INTEGER PRIMARY KEY AUTOINCREMENT, leftScore INTEGER, rightScore INTEGER, minutes TEXT, seconds TEXT)",
    );
  }

  Future<List<Score>> getScore() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('score');

    return List.generate(maps.length, (index) {
      return Score(
        leftScore: maps[index]['leftScore'],
        rightScore: maps[index]['rightScore'],
        minutes: maps[index]['minutes'],
        seconds: maps[index]['seconds'],
      );
    });
  }

  Future<void> insertScore(Score score) async {
    final db = await database;

    await db.insert('score', score.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteAll() async {
    final db = await database;

    await db.delete('score').then((value) => print("delete All"));
  }
} //DB_helper

// class DB_Helper {
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//     return openDatabase(join(path, 'score.db'),
//         onCreate: (database, version) async {
//       await database.execute(
//           "CREATE TABLE score(id INTEGER PRIMARY KEY AUTOINCREMENT, leftScore INTEGER, rightScore INTEGER, minutes TEXT, seconds TEXT)");
//     });
//   }

//   Future<int> insertScore(List<Score> scores) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     for (var score in scores) {
//       result = await db.insert('score', score.toMap());
//     }
//     return result;
//   }

//   Future<List<Score>> retrieveScores() async {
//     final Database db = await initializeDB();
//     final List<Map<String, Object?>> queryResult = await db.query('score');
//     return queryResult.map((e) => Score.fromMap(e)).toList();
//   }
// }

