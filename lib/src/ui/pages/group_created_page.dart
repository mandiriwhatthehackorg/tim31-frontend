import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCreatedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GroupCreatedPageState();
  }
}

class _GroupCreatedPageState extends State<GroupCreatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set Group Detail",
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF2F4F5),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              padding: EdgeInsets.all(40),
              color: Color(0xFF003D79),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi, Eko",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  Text(
                    "Your new group Trip to Japan",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "Has Been Created",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Share Your Invitation Code",
                    style: TextStyle(fontSize: 16, color: Color(0xFF666E80)),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Now rally your friends around and",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Text(
                            "go hit that goal!",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          
                          Container(
                            width: 200,
                            height: 40,
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "    MWTH2019!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: FlatButton(
                                    child: Text(
                                      "Share",
                                      style: TextStyle(
                                         color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Color(0xFF67B2E8),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF67B2E8),
                                style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.transparent),
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}