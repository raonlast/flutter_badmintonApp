import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {
  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'score_database.db'),
  //   onCreate: (db, version) {
  //     return db.execute(
  //       '''
  //         create table score(
  //           id integer primary key autoincrement,
  //           leftScore integer,
  //           rightScore integer,
  //         )
  //       ''',
  //     );
  //   },
  //   version: 1,
  // );
  var _db;

  Future<Database> get database async {
    _db = openDatabase(
      join(await getDatabasesPath(), 'score_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "create table score(id integer primary key autoincrement, leftScore integer, rightScore integer)",
        );
      },
    );

    return _db;
  }

  Future<void> insertScore(Score score) async {
    final Database db = await database;

    await db.insert(
      'score',
      score.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> scores() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('score');

    return maps;

    // List.generate(maps.length, (index) {
    //   return Score(
    //     leftScore: maps[index]['leftScore'],
    //     rightScore: maps[index]['rightScore'],
    //   );
    // });
  }

  Future<void> deleteScore(int id) async {
    final db = await database;

    await db.delete(
      'score',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

class Score {
  // final int leftPoint;
  final int leftScore;
  // final int rightPoint;
  final int rightScore;
  final String minutes;
  final String seconds;

  Score({
    // required this.leftPoint,
    required this.leftScore,
    // required this.rightPoint,
    required this.rightScore,
    required this.minutes,
    required this.seconds,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'leftPoint': leftPoint,
      'leftScore': leftScore,
      // 'rightPoint': rightPoint,
      'rightScore': rightScore,
      'minutes': minutes,
      'seconds': seconds,
    };
  }

  // @override
  // Card card() {
  //   return Card(
  //     child: ListTile(
  //       title: Text("$leftScore : $rightScore"),
  //     ),
  //   );
  // }
  @override
  String toString() {
    return 'Score{leftScore: $leftScore, rightScore: $rightScore}';
  }
}

// class DB_helper {
//   late Database db;
  
//   Future open(String path) async {
//     db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute(
//         '''
//           create table score (
//             _id integer primary key autoincrement,
//             leftPoint integer not null,
//             leftScore integer not null,
//             rightPoint integer not null,
//             rightScore integer not null,
//           )
//         '''
//         );
//       }
//     );
//   }

//   Future<
// }