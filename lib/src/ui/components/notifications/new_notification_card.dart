import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';

class NewNotificationCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewNotificationCardState();
  }
}

class _NewNotificationCardState extends State<NewNotificationCard> {
  
  bool isApproved = false;
  bool isRejected = false;
  bool isShowButton = true;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AsphaltColor.blue40,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Daisy Darmawati requested to join your group Arisan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14
            ),
          ),
          isApproved ? Text(
            "Appoved!",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ) : Container(),
          isRejected ? Text(
            "Declined!",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ) : Container(),
          isShowButton ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 32,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      Text(
                        "Decline",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ),
                onTap: () {
                  setState(() {
                    isRejected = true;
                    isShowButton = false;
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  height: 32,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      Text(
                        "Approve",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ),
                onTap: () {
                  setState(() {
                    isApproved = true;
                    isShowButton = false;
                  });
                },
              ),
            ],
          ) : Container()
        ],
      )
    );
  }
}