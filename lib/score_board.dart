import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/db/db.dart';
import 'package:flutter_application_1/history_page.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:flutter_application_1/providers/gameSetting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  //Timer 변수들
  Timer? _secondTimer;
  Timer? _minuteTimer;
  int _seconds = 1;
  int _minutes = 0;
  String _secondResult = "01";
  String _minuteResult = "00";
  bool _isPlaying = false;

  int maxScore = 0;
  int maxPoint = 0;
  int leftScore = 0;
  int leftPoint = 0;
  int rightScore = 0;
  int rightPoint = 0;

  @override
  void initState() {
    super.initState();
    // _loadCounter();

    if (!_isPlaying) {
      startTimer();
      // _minuteTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      //   if (_minutes < 9)
      // });

      _isPlaying = !_isPlaying;
    }
  }

  @override
  void dispose() {
    _secondTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _secondTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == -1) {
        print("0");
        setState(() {
          _minutes++;
        });
      }
      if (_seconds < 10) {
        setState(() {
          _seconds++;
          _secondResult = "0$_seconds";
        });
      } else {
        setState(() {
          _seconds++;
          _secondResult = "$_seconds";
        });
      }
      if (_seconds == 59) {
        setState(() {
          _seconds = -1;
        });
      }
      if (_minutes < 9) {
        _minuteResult = "0$_minutes";
      } else {
        _minuteResult = "$_minutes";
      }
      // if (_seconds == -1) {
      //   print("2");
      //   setState(() {
      //     _minutes++;
      //   });
      // }
      // print(_seconds);
    });
  }

  _updateTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var timer = (prefs.getStringList('timer') ?? []);
    print('time is $timer');
    await prefs.setStringList('timer', [_minuteResult, _secondResult]);
  }

  @override
  Widget build(BuildContext context) {
    //테스트 ( hoteload를 위해)
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeLeft]);
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //반응형
    // final deviceWidth = MediaQuery.of(context).size.width;
    // print(Provider.of<GameSetting>(context).getScore);
    int maxScore = Provider.of<GameSetting>(context).getScore;
    int maxPoint = Provider.of<GameSetting>(context).getPoint;
    int leftScore = Provider.of<GameCounter>(context).getLeftScore;
    int leftPoint = Provider.of<GameCounter>(context).getLeftPoint;
    int rightScore = Provider.of<GameCounter>(context).getRightScore;
    int rightPoint = Provider.of<GameCounter>(context).getRightPoint;

    //최대 스코어에 도달할 때 => 우승
    if (maxScore == leftScore) {
      return Center(
        child: AlertDialog(
          title: Text("Left Side Win !"),
          actions: [
            TextButton(
              onPressed: () => {
                // UX를 고려해 max 세트, 점수는 초기화 X
                // context.read<GameSetting>().resetAll(),
                // DB_helper().insertScor
                context
                    .read<GameCounter>()
                    .saveData(_minuteResult, _secondResult),
                _updateTimer(),
                context.read<GameCounter>().resetAll(),
                // Navigator.pop(context, 'Cancel'),
                // Navigator.pushReplacementNamed(context, '/').then((value) =>
                //     SystemChrome.setPreferredOrientations(
                //         [DeviceOrientation.portraitUp]))
                Navigator.popUntil(context, ModalRoute.withName('/')),
              },
              child: Text("Back"),
            ),
          ],
        ),
      );
    }
    if (maxScore == rightScore) {
      return Center(
        child: AlertDialog(
          title: Text("Right Side Win !"),
          actions: [
            TextButton(
              onPressed: () => {
                // UX를 고려해 max 세트, 점수는 초기화 X
                // context.read<GameSetting>().resetAll(),
                context
                    .read<GameCounter>()
                    .saveData(_minuteResult, _secondResult),
                _updateTimer(),
                context.read<GameCounter>().resetAll(),
                // Navigator.popUntil(context, (route) => route.isFirst),
                Navigator.pushReplacementNamed(context, '/').then((value) =>
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]))
              },
              child: Text("돌아가기"),
            ),
          ],
        ),
      );
    }

    return Row(
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
                          // _pointCounter("left", "decre");
                          if (leftPoint == 0) {
                            return;
                          }
                          if (_isPlaying) {
                            context.read<GameCounter>().decrePoint("left");
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 270,
                          //투명색
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              context
                                  .watch<GameCounter>()
                                  .getLeftPoint
                                  .toString(),
                              // '$_leftPointScore',
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
                          //경기 시간 타이머가 pause가 되면 점수 카운트 불가하도록
                          if (_isPlaying) {
                            // if (leftPoint == maxPoint - 1) {
                            //   context.read<GameCounter>().increScore("left");
                            //   context.read<GameCounter>().resetPoint();
                            // } else {
                            //   context.read<GameCounter>().increPoint("left");
                            // }
                            // if (leftPoint == maxPoint - 1 &&
                            //     rightPoint == maxPoint - 1) {
                            //   context.read<GameSetting>().deuce();
                            //   context.read<GameCounter>().increPoint("left");
                            //   deuceMaxPoint++;
                            //   return;
                            // }
                            if (leftPoint == maxPoint - 1) {
                              context.read<GameCounter>().increScore("left");
                              context.read<GameCounter>().resetPoint();
                            } else {
                              context.read<GameCounter>().increPoint("left");
                            }
                          }
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
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                                    // _gamesCounter("left", "decre");
                                    if (leftScore == 0) {
                                      return;
                                    }
                                    if (_isPlaying) {
                                      context
                                          .read<GameCounter>()
                                          .decreScore("left");
                                    }
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 135,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        // '$_leftGamesScore',
                                        context
                                            .watch<GameCounter>()
                                            .getLeftScore
                                            .toString(),
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
                                    // _gamesCounter("left", "incre");
                                    if (_isPlaying) {
                                      context
                                          .read<GameCounter>()
                                          .increScore("left");
                                    }
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
                                  // _gamesCounter("right", "decre");
                                  if (rightScore == 0) {
                                    return;
                                  }
                                  if (_isPlaying) {
                                    context
                                        .read<GameCounter>()
                                        .decreScore("right");
                                  }
                                },
                                child: Container(
                                  width: 90,
                                  height: 135,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      // '$_rightGamesScore',
                                      context
                                          .watch<GameCounter>()
                                          .getRightScore
                                          .toString(),
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
                                  // _gamesCounter("right", "incre");
                                  if (_isPlaying) {
                                    context
                                        .read<GameCounter>()
                                        .increScore("right");
                                  }
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
              ],
            ),
            Text(
              "$_minuteResult:$_secondResult",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 40,
                onPressed: () {
                  if (_isPlaying) {
                    _secondTimer?.cancel();
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                    print(_isPlaying);
                    print("pause");
                  } else {
                    startTimer();
                    // _secondTimer?.cancel();
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                    print("play");
                  }
                })
          ],
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
                        // _pointCounter("right", "decre");
                        // context.read<GameCounter>().increPoint("left");
                        //   if (leftPoint == maxPoint) {
                        //     context.read<GameCounter>().increScore("left");
                        //     context.read<GameCounter>().clearPoint("left");
                        //   }
                        if (rightPoint == 0) {
                          return;
                        }
                        if (_isPlaying) {
                          context.read<GameCounter>().decrePoint("right");
                        }
                      },
                      child: Container(
                        width: 180,
                        height: 270,
                        //투명색
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            // "$_rightPointScore",
                            context
                                .watch<GameCounter>()
                                .getRightPoint
                                .toString(),
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
                        // _pointCounter("right", "incre");
                        if (_isPlaying) {
                          // if (leftPoint == maxPoint - 1 &&
                          //     rightPoint == maxPoint - 1) {
                          //   context.read<GameSetting>().deuce();
                          //   return;
                          // }
                          if (rightPoint == maxPoint - 1) {
                            context.read<GameCounter>().increScore("right");
                            context.read<GameCounter>().resetPoint();
                          } else {
                            context.read<GameCounter>().increPoint("right");
                          }
                          // if (rightPoint == maxPoint || leftPoint == maxPoint) {
                          //   context.read<GameCounter>().resetPoint();
                          //   return;
                          // }
                          // if (rightPoint == maxPoint - 1) {
                          //   context.read<GameCounter>().increScore("right");
                          //   context.read<GameCounter>().increPoint("right");
                          // } else {
                          //   context.read<GameCounter>().increPoint("right");
                          // }
                        }
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
    );
  }
}
