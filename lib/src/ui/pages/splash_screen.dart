import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF003D79),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 380),
            ),
            Image.asset(
              "assets/images/bankit_white.png",
              width: 150,
              fit: BoxFit.contain,
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "powered by",
                      style: TextStyle(
                        color: Color(0xFF8FADCC),
                        fontSize: 18
                      ),
                    ),
                    margin: EdgeInsets.only(right: 10, top: 6),
                  ),
                  Image.asset(
                    "assets/images/mandiri_white.png",
                    width: 73,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}