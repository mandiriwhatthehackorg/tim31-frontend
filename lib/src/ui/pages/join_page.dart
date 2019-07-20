import 'package:flutter/material.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:hepengta/src/ui/components/homes/group_card_join.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';

class JoinPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _JoinPageState();
  }
}

class _JoinPageState extends State<JoinPage> {
  bool isShowCard = false;
  bool isLoading = false;
  
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
              color: Color(0xFF67B2E8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi, Eko!",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Have an Invitation \nCode?",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  Text(
                    "Let’s find your friends and get you started!",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                        filled: true
                      ),
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 8,
                      buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 44,
                    child: IconButton(
                      icon: Icon(Icons.send),
                      color: Color(0xFFACB2BF),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                          isShowCard = false;
                        });
                        
                        new Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            isShowCard = !isShowCard;
                            isLoading = false;
                          });
                        });
                      },
                    )
                  )
                ]
              ),
            ),
            Divider(color: Colors.transparent, height: 20),
            isLoading ? Center(
              child: new CircularProgressIndicator(),
            ) : Container(),
            isShowCard ? GroupCardJoin(
              data: GroupCardData(
                name: "Trip to Japan",
                targetBalance: "123123",
                remainingDay: "12",
                percentage: "0.1",
                currentBalance: "123123123"
              ),
              color: AsphaltColor.orange50,
            ) : Container()
          ],
        ),
      )
    );
  }
}