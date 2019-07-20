import 'package:flutter/material.dart';
import 'package:hepengta/src/resources/group_api.dart';
import 'package:hepengta/src/ui/pages/group_created_page.dart';

class PinPage extends StatefulWidget {
  String groupName;
  String targetAmount;
  String targetDate;
  String monthlyTarget;
  String accountNumber;

  PinPage({
    this.groupName,
    this.targetAmount,
    this.targetDate,
    this.monthlyTarget,
    this.accountNumber
  });
  
  @override
  State<StatefulWidget> createState() {
    return _PinPageState();
  }
}

class _PinPageState extends State<PinPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security Check"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF003D79),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Please Enter\nYour 6 Digit Pin",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28
              ),
            ),
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 3),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                        onChanged: (pin) {
                          if(pin.length == 6) {
                            _createGroup();
                            
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GroupCreatedPage())
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }

  Future<bool> _createGroup() async {
    var groupAPI = GroupApi();
    return groupAPI.createGroup(widget.groupName, widget.targetAmount, widget.targetDate, true, "1");
  }
}