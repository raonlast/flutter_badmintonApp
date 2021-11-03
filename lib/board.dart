import 'package:flutter/material.dart';
import 'package:flutter_application_1/score_board.dart';

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
