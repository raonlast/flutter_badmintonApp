import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaxPoints with ChangeNotifier {}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    //앱을 실행시킨 기기의 width & height
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    var _selectecSetScore = 1;
    final _setScore = <int>[1, 2, 3, 4, 5];

    return Scaffold(
      appBar: AppBar(
        title: Text("Match Setting"),
      ),
      body: Column(
        children: [
          Container(
            width: deviceWidth * 0.8,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Point Setting",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              // margin: const EdgeInsets.all(50),
              width: deviceWidth * 0.7,
              height: deviceWidth * 0.15,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '점수 제한',
                ),
              ),
            ),
          ),
          DropdownButton(
            value: dropdownValue,
            elevation: 16,
            style: const TextStyle(color: Colors.blueGrey),
            underline: Container(
              width: 30,
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['1', '2', '3', '4', '5']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          
          //int 타입 dropdownButton 에러
          // DropdownButton<int>(
          //   value: _selectecSetScore,
          //   items: _setScore.map<DropdownMenuItem<int>>((int value) {
          //     return DropdownMenuItem<int>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (int? value) {
          //     setState(() {
          //       _selectecSetScore = value;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
