import 'package:flutter/material.dart';
import 'package:flutter_application_1/score_board.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // String dropdownValue = '1';

  @override
  void initState() {
    super.initState();
  }

  // String inputMaxPoint = "";
  // String inputMaxScore = "";
  final inputMaxPoint = TextEditingController();
  final inputMaxScore = TextEditingController();

  // var _selectecSetScore = 1;
  // final _setScore = <int>[1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //앱을 실행시킨 기기의 width & height
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Match Setting"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Icon(
              //       Icons.remove,
              //       color: Colors.blue,
              //       size: 20,
              //     )
              //   ],
              // ),

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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    controller: inputMaxPoint,
                    keyboardType: TextInputType.number,
                    // onChanged: (text) {
                    //   setState(() {
                    //     inputMaxPoint = text;
                    //   });
                    // },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '점수 제한',
                    ),
                  ),
                ),
              ),
              Container(
                width: deviceWidth * 0.8,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Score Setting",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    controller: inputMaxScore,
                    keyboardType: TextInputType.number,
                    // onChanged: (text) {
                    //   setState(() {
                    //     inputMaxScore = text;
                    //   });
                    // },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '세트 제한',
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 25, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScoreBoard()),
                          );
                        },
                        child: Text("완료")),
                  ),
                ],
              ),
              // DropdownButton(
              //   value: dropdownValue,
              //   elevation: 16,
              //   style: const TextStyle(color: Colors.blueGrey),
              //   underline: Container(
              //     width: 30,
              //     height: 2,
              //     color: Colors.blueAccent,
              //   ),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownValue = newValue!;
              //     });
              //   },
              //   items: <String>['1', '2', '3', '4', '5']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),

              // //int 타입 dropdownButton 에러
              // DropdownButton(
              //   value: _selectecSetScore,
              //   onChanged: (int? newValue) {
              //     setState(() {
              //       _selectecSetScore = newValue!;
              //     });
              //   },
              //   items: _setScore.map((int value) {
              //     return new DropdownMenuItem(
              //       value: value,
              //       child: new Text(value.toString()),
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
