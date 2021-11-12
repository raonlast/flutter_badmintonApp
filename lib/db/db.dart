import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Score {
  int? id;
  int leftScore;
  int rightScore;
  String minutes;
  String seconds;
  int day;
  int month;
  int year;
  // String? datetime;

  Score({
    this.id,
    required this.leftScore,
    required this.rightScore,
    required this.minutes,
    required this.seconds,
    required this.day,
    required this.month,
    required this.year,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'leftScore': leftScore,
      'rightScore': rightScore,
      'minutes': minutes,
      'seconds': seconds,
      'day': day,
      'month': month,
      'year': year,
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
    _db = openDatabase(join(await getDatabasesPath(), 'badminton.db'),
        onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE badminton(id INTEGER PRIMARY KEY AUTOINCREMENT, leftScore INTEGER, rightScore INTEGER, minutes TEXT, seconds TEXT, day INTEGER, month INTEGER, year INTEGER)",
      );
    }, version: 1);
    return _db;
  }

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'badminton.db'), version: 1,
        onCreate: (database, version) async {
      await database.execute(
          "CREATE TABLE badminton(id INTEGER PRIMARY KEY AUTOINCREMENT, leftScore INTEGER, rightScore INTEGER, minutes TEXT, seconds TEXT, day INTEGER, month INTEGER, year INTEGER)");
    });
  }

  // Future<dynamic> alterTable(String ColumnName) async {
  //   final db = await database;
  //   var count =
  //       await db.execute("ALTER TABLE score ADD COLUMN $ColumnName TEXT");
  //   print(await db.query('score'));
  //   return count;
  // }

  Future<List<Score>> getScore() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('badminton');

    return List.generate(maps.length, (index) {
      return Score(
        id: maps[index]['id'],
        leftScore: maps[index]['leftScore'],
        rightScore: maps[index]['rightScore'],
        minutes: maps[index]['minutes'],
        seconds: maps[index]['seconds'],
        day: maps[index]['day'],
        month: maps[index]['month'],
        year: maps[index]['year'],

        // end_time: maps[index]['endTime'],
      );
    });
  }

  Future<void> insertScore(Score score) async {
    final db = await database;

    await db.insert('badminton', score.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteScore(int id) async {
    final db = await database;

    await db.delete('badminton', where: 'id=?', whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    final db = await database;

    await db.delete('badminton').then((value) => print("delete All"));
  }
} //DB_helper

// class DB_Helper {

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

