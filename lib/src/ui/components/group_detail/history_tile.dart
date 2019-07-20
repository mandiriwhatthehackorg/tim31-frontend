import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/models/history.dart';
import 'package:hepengta/src/ui/components/homes/group_card.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HistoryTileDetail extends StatefulWidget {
  History history;

  HistoryTileDetail({this.history});

  @override
  State<StatefulWidget> createState() {
    return _HistoryTileState();
  }
}

class _HistoryTileState extends State<HistoryTileDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12),
                child: UserBadged(
                  initial: "ES",
                  color: Colors.green,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Eko Simanjuntak",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "IDR " +widget.history.amount,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF003D79),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "/ IDR 1.000.000",
                        style: TextStyle(
                          color: AsphaltColor.black50,
                          fontSize: 13
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          CircularPercentIndicator(
            radius: 40.0,
            animation: true,
            animationDuration: 3000,
            lineWidth: 3.0,
            percent: 0.62,
            center: new Text("62 %"),
            progressColor: AsphaltColor.green50,
            circularStrokeCap: CircularStrokeCap.round,
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
        result += amount[i] + ".";
        counter = 0;
      } else {
        result += amount[i];
      }
    }
  
    return "IDR " + result.split("").reversed.join();
  }
}