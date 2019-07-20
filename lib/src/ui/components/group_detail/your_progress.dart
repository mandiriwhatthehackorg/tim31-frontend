import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class YourProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Your Personal Progress"),
              Text(
                "Edit",
                style: TextStyle(
                  color: AsphaltColor.blue40
                ),
              )
            ],
          ),
          Divider(),
          Text(
            "Balance",
            style: TextStyle(
              fontSize: 13
            ),
          ),
          Text(
            buildCurrencyFormat("3500000"),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            child: LinearPercentIndicator(
              lineHeight: 8,
              animation: true,
              animationDuration: 2000,
              percent: 0.45,
              backgroundColor: AsphaltColor.yellow10,
              progressColor: Color(0xFFFFB700),
            ),
          ),
          Divider(height: 20, color: Colors.transparent,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(""
                    "Monthly Debit",
                    style: TextStyle(
                      color: Color(0xFFACB2BF)
                    ),
                  ),
                  Text( buildCurrencyFormat("55000"))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(""
                    "Target",
                    style: TextStyle(
                      color: Color(0xFFACB2BF)
                    ),
                  ),
                  Text( buildCurrencyFormat("1600000"))
                ],
              ),
            ],
          )
        ],
      ),
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
