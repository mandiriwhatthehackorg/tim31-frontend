import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/components/buttons/filled_button.dart';
import 'package:hepengta/src/ui/pages/pin_page.dart';

class CreateGroupSummary extends StatefulWidget {
  String groupName;
  String targetAmount;
  String targetDate;
  String monthlyTarget;
  String accountNumber;
  
  CreateGroupSummary({
    this.groupName,
    this.targetAmount,
    this.targetDate,
    this.monthlyTarget,
    this.accountNumber
  });
  
  @override
  State<StatefulWidget> createState() {
    return _CreateGroupSummaryState();
  }
}

class _CreateGroupSummaryState extends State<CreateGroupSummary>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Group Summary",
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
                    "Hi, Eko!",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Alraedy set up your group dream? \nPleace recheck?",
                    style: TextStyle(color: Colors.white, fontSize: 23),
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
                    "New Goal Summary",
                    style: TextStyle(fontSize: 16, color: Color(0xFF666E80)),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Goal Name",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Text(widget.groupName)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Group Goal Amount",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Text(buildCurrencyFormat(widget.targetAmount))
                        ],
                      )
                    ],
                  ),
                  Divider(color: Colors.transparent),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Deadline",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Text(widget.targetDate)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Monthly Group Saving Goal",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Text(buildCurrencyFormat(widget.monthlyTarget))
                        ],
                      )
                    ],
                  ),
                  Divider(color: Colors.transparent),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Auto debet account",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      Text(widget.accountNumber)
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      FilledButton(
                        buttonText: "Create Group Dream",
                        textColor: Color(0xFF67B2E8),
                        width: 300,
                        height: 49,
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PinPage(
                                groupName: widget.groupName,
                                targetAmount: widget.targetAmount,
                                targetDate: widget.targetDate,
                                accountNumber: widget.accountNumber,
                                monthlyTarget: widget.monthlyTarget,
                              )
                            )
                          );
                        },
                      )
                    ],
                  )
                ]
              ),
            )
          ],
        ),
      )
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
