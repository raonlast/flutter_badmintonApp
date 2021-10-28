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
  int _leftPointScore = 0;
  int _leftGamesScore = 0;
  int _rightPointScore = 0;
  int _rightGamesScore = 0;

  void _pointCounter(String team, String state) {
    if (team == "left") {
      if (state == "incre") {
        if (_leftPointScore < 25) {
          setState(() {
            _leftPointScore++;
          });
        } else {
          setState(() {
            _leftPointScore = 0;
          });
        }
      } else if (state == "decre") {
        if (_leftPointScore > 0) {
          setState(() {
            _leftPointScore--;
          });
        } else {
          setState(() {
            _leftPointScore = 25;
          });
        }
      }
    } else if (team == "right") {
      if (state == "incre") {
        if (_rightPointScore < 25) {
          setState(() {
            _rightPointScore++;
          });
        } else {
          setState(() {
            _rightPointScore = 0;
          });
        }
      } else if (state == "decre") {
        if (_rightPointScore > 0) {
          setState(() {
            _rightPointScore--;
          });
        } else {
          setState(() {
            _rightPointScore = 25;
          });
        }
      }
    }
  }

  void _gamesCounter(String team, String state) {}

  @override
  Widget build(BuildContext context) {
    //반응형
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.grey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: SizedBox(
                        width: 180,
                        height: 270,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _pointCounter("left", "decre");
                                  },
                                  child: Container(
                                    width: 180,
                                    height: 270,
                                    //투명색
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        '$_leftPointScore',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 150,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _pointCounter("left", "incre");
                                  },
                                  child: Container(
                                    width: 180,
                                    height: 135,
                                    //투명색
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                      // margin: const EdgeInsets.only(left: 10),
                      ),
                  const Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: SizedBox(
                        width: 90,
                        height: 135,
                        child: Center(
                          child: Text(
                            "2",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 90,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  const Card(
                    color: Colors.black,
                    elevation: 6.0,
                    child: SizedBox(
                      width: 90,
                      height: 135,
                      child: Center(
                        child: Text(
                          "3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 90,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 6.0,
                    child: SizedBox(
                      width: 180,
                      height: 270,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _pointCounter("right", "decre");
                                },
                                child: Container(
                                  width: 180,
                                  height: 270,
                                  //투명색
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      "$_rightPointScore",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 150,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pointCounter("right", "incre");
                                },
                                child: Container(
                                  width: 180,
                                  height: 135,
                                  //투명색
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]));
  }
}
