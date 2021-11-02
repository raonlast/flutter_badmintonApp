import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:flutter_application_1/providers/gameSetting.dart';
import 'package:flutter_application_1/score_board.dart';
import 'package:flutter_application_1/setting_page.dart';
import 'package:provider/provider.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: SettingPage(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Board()));
        },
      ),
    );
  }
}

class Board extends StatelessWidget {
  Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreBoard(),
          ],
        ),
      ),
    );
  }
}
