import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/history_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:flutter_application_1/providers/gameSetting.dart';
import 'package:flutter_application_1/score_board.dart';
import 'package:flutter_application_1/setting_page.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => GameCounter()),
        ChangeNotifierProvider(create: (BuildContext context) => GameSetting())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<Database> database = initDatabase();
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HistoryPage(),
        '/login': (context) => LoginPage(),
        '/setting': (context) => SettingPage(),
        '/board': (context) => ScoreBoard(),
      },
    );
  }

  // Future<Database> initDatabase() async {
  //   return openDatabase(join(await getDatabasesPath(), 'scores_database.db'),
  //       version: 1, onCreate: (db, version) {
  //     return db.execute('''
  //         CREATE TABLE score(id INTEGER PRIMARY KEY AUTOINCREMENT, leftScore INTEGER, rightScore INTEGER, minutes STRING, seconds STRING)
  //       ''');
  //   });
  // }
}
