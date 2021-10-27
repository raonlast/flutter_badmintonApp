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
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("white clicked");
                                },
                                child: Container(
                                  width: 180,
                                  height: 270,
                                  //투명색
                                  color: Colors.transparent,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("blue clicked");
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
                      )
                      // margin: const EdgeInsets.only(left: 10),
                      ),
                  Card(
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
                  Card(
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
                        child: Center(
                          child: Text("12",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 150,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ],
                // margin: const EdgeInsets.only(left: 10),
              ),
            ]));
  }
}
