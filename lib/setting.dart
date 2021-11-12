import 'package:flutter/material.dart';
import 'package:flutter_application_1/board.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:flutter_application_1/setting_page.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Board()))
              .then((value) {
            // print("setting_pageeeeeeeeeeeeee");
            context.read<GameCounter>().resetAll();
          });
        },
      ),
    );
  }
}
