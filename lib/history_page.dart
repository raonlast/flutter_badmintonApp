import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/db/db.dart';
import 'package:flutter_application_1/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/gameCounter.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var timer = [];
  bool loading = false;
  List? data;

  @override
  void initState() {
    super.initState();
    loadData();
    // data = [];
    _loadTimer();
  }

  void loadData() async {
    setState(() {
      loading = true;
    });
    data = await DB_helper().scores();
    print(data);
    setState(() {
      loading = false;
    });
  }

  _loadTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var timer = (prefs.getStringList('timer') ?? []);

    print(timer);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    if (!loading) {
      return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("History Page"),
          ),
          body: Column(
            children: List.generate(data!.length, (index) {
              return GestureDetector(
                onTap: () {
                  DB_helper().deleteScore(data![index]['id']);
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                        "SCORE = ${data![index]['leftScore']} : ${data![index]['rightScore']}"),
                    subtitle: Text(
                        "${data![index]['minutes']} : ${data![index]['seconds']}"),
                  ),
                ),
              );
            }),
            // ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Card(
            //       child: ListTile(
            //         title: Text("${data[index].leftScore}"),
            //       ),
            //     );
            //   }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SettingPage())).then(
                  (value) => SystemChrome.setPreferredOrientations(
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