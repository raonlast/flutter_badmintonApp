import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            _gamesCounter("left", "incre");
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
            _gamesCounter("right", "incre");
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

  void _gamesCounter(String team, String state) {
    if (team == "left") {
      if (state == "incre") {
        if (_leftGamesScore < 3) {
          setState(() {
            _leftGamesScore++;
            _leftPointScore = 0;
            _rightPointScore = 0;
          });
        } else {
          setState(() {
            _leftGamesScore = 0;
          });
        }
      } else if (state == "decre") {
        if (_leftGamesScore > 0) {
          setState(() {
            _leftGamesScore--;
          });
        } else {
          setState(() {
            _leftGamesScore = 3;
          });
        }
      }
    } else if (team == "right") {
      if (state == "incre") {
        if (_rightGamesScore < 3) {
          setState(() {
            _rightGamesScore++;
            _rightPointScore = 0;
            _leftPointScore = 0;
          });
        } else {
          setState(() {
            _rightGamesScore = 0;
          });
        }
      } else if (state == "decre") {
        if (_rightGamesScore > 0) {
          setState(() {
            _rightGamesScore--;
          });
        } else {
          setState(() {
            _rightGamesScore = 3;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //반응형
    // final deviceWidth = MediaQuery.of(context).size.width;

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
                  Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: SizedBox(
                          width: 90,
                          height: 135,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _gamesCounter("left", "decre");
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 135,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          '$_leftGamesScore',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 90,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _gamesCounter("left", "incre");
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 67.5,
                                      color: Colors.transparent,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))),
                  Card(
                    color: Colors.black,
                    elevation: 6.0,
                    child: SizedBox(
                        width: 90,
                        height: 135,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _gamesCounter("right", "decre");
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 135,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        '$_rightGamesScore',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 90,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _gamesCounter("right", "incre");
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 67.5,
                                    color: Colors.transparent,
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
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
