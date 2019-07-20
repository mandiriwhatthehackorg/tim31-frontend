import 'package:flutter/material.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:hepengta/src/ui/pages/group_detail_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GroupCard extends StatefulWidget {
  GroupCardData data;
  Color color;
  
  GroupCard({@required this.data, this.color});

  @override
  State<StatefulWidget> createState() {
    return _GroupCardState();
  }
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                        color: widget.color,
                    ),
                  ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.data.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    buildCurrencyFormat(widget.data.currentBalance),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D79),
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                        buildCurrencyFormat(widget.data.targetBalance),
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(height: 4),
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
                            ],
                          ),
                        ),
                        Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CircularPercentIndicator(
                                radius: 80.0,
                                animation: true,
                                lineWidth: 9.0,
                                percent: double.parse(widget.data.percentage),
                                center: new Text(widget.data.percentage + " %"),
                                progressColor: widget.color,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "5 members",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      UserBadged(initial: "ES", color: Colors.orange),
                                      UserBadged(initial: "ST", color: Colors.blue),
                                      UserBadged(initial: "NN", color: Colors.green),
                                      UserBadged(initial: "2+", color: Colors.grey),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupDetailPage(data: widget.data)
              )
            );
          },
        )
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

class UserBadged extends StatelessWidget {
  String initial;
  Color color;
  
  UserBadged({this.initial, this.color});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.only(left: 4),
      child: Center(
        child: Text(
          this.initial,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: this.color
      ),
    );
  }
}