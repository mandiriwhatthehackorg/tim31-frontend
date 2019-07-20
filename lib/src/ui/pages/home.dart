import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/components/homes/header_card.dart';
import 'package:hepengta/src/ui/components/homes/horizontal_group_list.dart';
import 'package:hepengta/src/ui/components/homes/in_and_out.dart';

import 'notification_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f4f5),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 10, right: 20),
            color: Color(0xFF003D79),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "assets/images/bankit_white.png",
                  height: 25,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationPage())
                    );
                  },
                )
              ],
            )
          ),
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Color(0xFF003D79),
                      height: 150,
                    )
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  child: HeaderCard(),
                ),
              ),
            ],
          ),
          ListHorizontalGroupCard(),
          InOutList(),
        ],
      )
    );
  }
}
