import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/components/buttons/filled_button.dart';
import 'package:hepengta/src/ui/pages/create_group_summary.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';

class SetGroupDetail extends StatefulWidget {
  String groupName;
  String targetAmount;
  
  SetGroupDetail(this.groupName, this.targetAmount);
  
  @override
  State<StatefulWidget> createState() {
    return _SetGroupDetailState();
  }
}

class _SetGroupDetailState extends State<SetGroupDetail> {
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final monthlyAmountController = TextEditingController();
  String selectedAutoSaver = "1535362251";
  List<String> autoSaverOptions = ["1535362251", "1432542557", "7386376363"];
  bool isCustomized = false;
  
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
                    "Anything you want \nto save for?",
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
                    "Goal Detail",
                    style: TextStyle(fontSize: 16, color: Color(0xFF666E80)),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Set Deadline",
                              style: TextStyle(color: Color(0xFF666E80)),
                            ),
                            TextField(
                              onTap: () {
                                _selectDate(context);
                              },
                              controller: dateController,
                              decoration: InputDecoration(filled: true),
                            ),
                          ],
                        )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Montly Saving Goal",
                              style: TextStyle(color: Color(0xFF666E80)),
                            ),
                            TextField(
                              controller: monthlyAmountController,
                              decoration: InputDecoration(filled: true),
                              readOnly: true,
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Set Auto Debet Account",
                          style: TextStyle(color: Color(0xFF666E80)),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedAutoSaver,
                          items: autoSaverOptions.map((String s) {
                            return DropdownMenuItem<String>(
                              value: s.toLowerCase(),
                              child: Text(s),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              selectedAutoSaver = value;
                            });
                          },
                        ),
                      ],
                    )),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Customize goal?"),
                            Text(
                              "This will let you and your group \nmembers to have your own personal goal",
                              style: TextStyle(
                                fontSize: 12, color: AsphaltColor.black60),
                            )
                          ],
                        ),
                        Switch(
                          value: this.isCustomized,
                          onChanged: (value) {
                            setState(() {
                              this.isCustomized = !this.isCustomized;
                              print(isCustomized);
                            });
                          },
                          activeTrackColor: Color(0xFF67B2E8),
                          activeColor: Color(0xFF003D79),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FilledButton(
                        buttonText: "Set Group Goal",
                        textColor: Color(0xFF67B2E8),
                        width: 300,
                        height: 49,
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateGroupSummary(
                                groupName: widget.groupName,
                                targetAmount: widget.targetAmount,
                                targetDate: dateController.text,
                                accountNumber: selectedAutoSaver,
                                monthlyTarget: monthlyAmountController.text,
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
  
  Future _selectDate(context) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 30)),
      firstDate: DateTime.now().add(Duration(days: 29)),
      lastDate: DateTime.now().add(Duration(days: 1095)));
    
    if (selectedDate != null) {
      var now = DateTime.now();
      
      int totalDay = selectedDate.difference(now).inDays;
      double totalMonth = totalDay / 30;
      print(totalMonth.floor());
      
      setState(() {
        this.dateController.text = selectedDate.toString().substring(0, 10);
        this.monthlyAmountController.text = (int.parse(widget.targetAmount) / totalMonth.floor()).toStringAsFixed(0).toString();
      });
    }
  }
}


