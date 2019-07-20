import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/models/history.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';

import 'group_card.dart';

class HistoryTile extends StatefulWidget {
  History history;

  HistoryTile({this.history});

  @override
  State<StatefulWidget> createState() {
    return _HistoryTileState();
  }
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: UserBadged(
                  color: AsphaltColor.orange50,
                  initial: "ED",
                ),
                padding: EdgeInsets.only(right: 12),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.history.user,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.history.title,
                    style: TextStyle(
                      color: AsphaltColor.black50,
                      fontSize: 13
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "+ " + buildCurrencyFormat(widget.history.amount),
                style: TextStyle(
                  fontSize: 14,
                  color: AsphaltColor.green50,
                  fontWeight: FontWeight.w900
                ),
              ),
              Text(
                widget.history.date,
                style: TextStyle(
                  color: AsphaltColor.black50,
                  fontSize: 13
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String buildCurrencyFormat(String amount) {
    String result = "";
  
    int counter = 0;
  
    for(int i=amount.length-1; i >= 0 ; i--) {
      counter++;
      if(counter == 3 && i != 0) {
        result += amount[i] + ",";
        counter = 0;
      } else {
        result += amount[i];
      }
    }
  
    return "IDR " + result.split("").reversed.join();
  }
}