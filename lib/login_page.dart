import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/history_page.dart';
import 'package:flutter_application_1/setting_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('loginPage');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Image.asset(
                  "assets/images/badminton.png",
                  width: size.width * 0.45,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Color(0xffb6b6b6),
                    borderRadius: BorderRadius.circular(29)),
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: InputBorder.none,
                    hintText: "Your ID",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Color(0xffb6b6b6),
                    borderRadius: BorderRadius.circular(29)),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    border: InputBorder.none,
                    hintText: "Your Password",
                  ),
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: ElevatedButton(
                    child: Text("LOGIN"),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             HistoryPage()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
