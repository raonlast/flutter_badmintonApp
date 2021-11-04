import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/setting_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("History Page"),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("History Example"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("History Example"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("History Example"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("History Example"),
              ),
            ),
            Card(
              child: ListTile(
                
                title: Text("History Example"),
              ),
            ),
          ],
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
  }
}


//.then((value) {SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);})