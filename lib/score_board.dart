import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:flutter_application_1/providers/gameSetting.dart';
import 'package:provider/provider.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //반응형
    // final deviceWidth = MediaQuery.of(context).size.width;
    // print(Provider.of<GameSetting>(context).getScore);
    int maxScore = Provider.of<GameSetting>(context).getScore;
    int maxPoint = Provider.of<GameSetting>(context).getPoint;
    int leftScore = Provider.of<GameCounter>(context).getLeftScore;
    int leftPoint = Provider.of<GameCounter>(context).getLeftPoint;
    int rightScore = Provider.of<GameCounter>(context).getRightScore;
    int rightPoint = Provider.of<GameCounter>(context).getRightPoint;

    //최대 점수를 넘어갈 때
    if (leftPoint > maxPoint) {
      context.watch<GameCounter>().overPoint("left");
    }
    if (rightPoint > maxPoint) {
      context.watch<GameCounter>().overPoint("right");
    }

    //최대 스코어에 도달할 때 => 우승
    if (maxScore == leftScore) {
      //alertDialog Fix 필요
      return AlertDialog(
        title: Text("winner!"),
        content: SingleChildScrollView(
          child: ListBody(children: [Text("왼쪽 팀 우승 !")]),
        ),
        actions: [
          TextButton(
            child: Text("닫기"),
            onPressed: () {
              context.watch<GameCounter>().resetAll();
              Navigator.pop(context);
            },
          )
        ],
      );
    }
    if (maxScore == rightScore) {
      //AlertDialog 작성예정
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
                          context.read<GameCounter>().decrePoint("left");
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
                          // _pointCounter("left", "incre");
                          context.read<GameCounter>().increPoint("left");
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
                            // _gamesCounter("left", "decre");
                            context.read<GameCounter>().decreScore("left");
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
                            context.read<GameCounter>().increScore("left");
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
                          context.read<GameCounter>().decreScore("right");
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
                          context.read<GameCounter>().increScore("right");
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
                        // _pointCounter("right", "decre");
                        context.read<GameCounter>().decrePoint("right");
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
                        context.read<GameCounter>().increPoint("right");
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
