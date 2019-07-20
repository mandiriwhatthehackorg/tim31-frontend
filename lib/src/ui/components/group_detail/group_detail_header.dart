import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GroupDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 240,
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFFFFB700),
                height: 180,
                child: Column(
                  children: <Widget>[
                    Container(
                      child:  Text("Edit", style: TextStyle(color: Colors.white)),
                      padding: EdgeInsets.only(top: 20, right: 20),
                      alignment: Alignment.centerRight,
                    ),
                    Text(
                      "Japan Trip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                    Text(
                      buildCurrencyFormat("14500000"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    Text(
                      "Amount collected",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: LinearPercentIndicator(
                        lineHeight: 8,
                        animation: true,
                        animationDuration: 2000,
                        percent: 0.34,
                        backgroundColor: Colors.white70,
                        progressColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 120),
          width: MediaQuery.of(context).size.width * 0.7,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          child: Container(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFB6B8BA),
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                    ),
                    Text(
                      buildCurrencyFormat("27000000"),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFB6B8BA),
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                    ),
                    Text(
                      "20 Desember 2020",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
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
