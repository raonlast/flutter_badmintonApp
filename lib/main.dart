import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScoreBoard(),
    );
  }
}

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    //반응형
    // double width = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.grey,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.black,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.green,
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.purple,
            width: 100,
            height: 100,
            // margin: const EdgeInsets.only(left: 10),
          ),
        ],
      ),
    );
  }
}
