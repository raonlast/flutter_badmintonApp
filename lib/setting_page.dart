import 'package:flutter/material.dart';
import 'package:flutter_application_1/board.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:flutter_application_1/providers/gameSetting.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int maxScore = 0;
  int maxPoint = 0;

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).orientation.toString();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    print("settingPage");
    // print(context.read<GameSetting>().getScore);
    // print(Provider.of<GameSetting>(context).getScore);

    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.add_circle_outlined),
                    iconSize: 50,
                    onPressed: () {
                      context.read<GameSetting>().increMaxScore();
                    }),
                Row(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 6.0,
                      child: SizedBox(
                        width: 120,
                        height: 150,
                        child: Center(
                            child: Text(
                          context.watch<GameSetting>().getScore.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                      ),
                    ),
                    Text(
                      "세트",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.remove_circle_outlined),
                  iconSize: 50,
                  onPressed: () {
                    context.read<GameSetting>().decreMaxScore();
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.add_circle_outlined),
                    iconSize: 50,
                    onPressed: () {
                      context.read<GameSetting>().increMaxPoint();
                    }),
                Row(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 6.0,
                      child: SizedBox(
                        width: 120,
                        height: 150,
                        child: Center(
                            child: Text(
                          context.watch<GameSetting>().getPoint.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                      ),
                    ),
                    Text(
                      "점",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.remove_circle_outlined),
                  iconSize: 50,
                  onPressed: () {
                    context.read<GameSetting>().decreMaxPoint();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Board()))
              .then((value) => context.read<GameCounter>().resetAll());
        },
      ),
    );
  }
}
