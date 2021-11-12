import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/db/db.dart';
import 'package:flutter_application_1/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';
import 'package:sqflite/sqflite.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var timer = [];
  bool loading = false;
  DB_Helper dbHelper = DB_Helper();
  Future<List<Score>>? getList;
  // late DB_Helper helper;

  @override
  void initState() {
    super.initState();
    // this.helper = DB_Helper();
    // this.helper.initializeDB();
    // _loadData();
    getList = dbHelper.getScore();
    _loadTimer();
  }

  // Future _loadData() async {
  //   print("getScore: ${await dbHelper.getScore().toString()}");
  //   print("getList: $getList");
  //   return getList;
  // }

  _loadTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var timer = (prefs.getStringList('timer') ?? []);

    print(timer);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    if (!loading) {
      return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("History Page"),
          ),
          body: Container(
            child: Center(
              child: FutureBuilder(
                future: getList,
                builder: (context, AsyncSnapshot<List<Score>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return CircularProgressIndicator();
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        List<Score> data = List.from(snapshot.data!.reversed);
                        // List<Score> data = snapshot.data!;
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, int index) {
                              print(index);
                              return GestureDetector(
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                        "${data[index].leftScore.toString()} : ${data[index].rightScore.toString()}"),
                                    subtitle: Text(
                                        "${data[index].minutes}m ${data[index].seconds}s"),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                  }
                },
              ),
            ),
          ),

          // FutureBuilder(
          //   future: this.helper.retrieveScores(),
          //   builder:
          //       (BuildContext context, AsyncSnapshot<List<Score>> snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //         itemCount: snapshot.data?.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Card(
          //             child: ListTile(
          //               contentPadding: EdgeInsets.all(8),
          //               title: Text(snapshot.data![index].leftScore.toString()),
          //             ),
          //           );
          //         },
          //       );
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => SettingPage())).then(
              //     (value) => SystemChrome.setPreferredOrientations(
              //         [DeviceOrientation.portraitUp]));
              Navigator.of(context).pushNamed('/setting').then((value) =>
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp]));
            },
            child: Icon(Icons.add),
          ),
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}

//.then((value) {SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);})
