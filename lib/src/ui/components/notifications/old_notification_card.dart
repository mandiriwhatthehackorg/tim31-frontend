import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OldNotificationCard extends StatefulWidget {
  String message;
  String time;
  
  OldNotificationCard({this.message, this.time});
  
  @override
  State<StatefulWidget> createState() {
    return _OldNotificationCardState();
  }
}

class _OldNotificationCardState extends State<OldNotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            widget.message,
            style: TextStyle(
              color: Color(0xFF666E80),
              fontSize: 14
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.time,
                style: TextStyle(
                  color: Color(0xFFACB2BF)
                ),
              ),
              Text(
                "View Goal",
                style: TextStyle(
                  color: Color(0xFF67B2E8)
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}