import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:hepengta/src/models/history.dart';
import 'package:hepengta/src/ui/components/group_detail/group_detail_header.dart';
import 'package:hepengta/src/ui/components/group_detail/history_tile.dart';
import 'package:hepengta/src/ui/components/group_detail/your_progress.dart';
import 'package:hepengta/src/ui/components/homes/history_tile.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';

class GroupDetailPage extends StatefulWidget {
  GroupCardData data;

  GroupDetailPage({@required this.data});

  @override
  State<StatefulWidget> createState() {
    return _GroupDetailPageState();
  }
}

class _GroupDetailPageState extends State<GroupDetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goal Detail"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            GroupDetailHeader(),
            YourProgress(),
            FriendProgress(),
          ],
        ),
        color: Color(0xFFF2F4F5),
      ),
    );
  }
}

class FriendProgress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 200,
      color: Colors.white,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Your Friend Progress"),
            ],
          ),
          Divider(),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _BuildInAndOutList(),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _BuildInAndOutList() {
  List<Widget> list = new List<Widget>();
  List<History> histories = [
    History(title: "Arisan Gang Sentosa", date: "01 June 2019", amount: "50.000", isOut: true),
    History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
    History(title: "Topup Mandiri", date: "27 June 2019", amount: "350.000", isOut: false),
    History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
  ];
  
  for(var i = 0; i < histories.length; i++){
    list.add(HistoryTileDetail(history: histories[i]));
    if(i != histories.length - 1) {
      list.add(Divider(color: Colors.transparent,));
    }
  }
  
  list.add(Divider());
  list.add(
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 40,
          child: FlatButton(
            child: Text(
              "Withdraw",
              style: TextStyle(
                color: AsphaltColor.blue40
              ),
            ),
            onPressed: () {
            
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            border: Border.all(
              color: AsphaltColor.blue40
            )
          ),
        ),
        Container(
          width: 150,
          height: 40,
          child: FlatButton(
            child: Text(
              "Top Up",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: () {
        
            },
          ),
          decoration: BoxDecoration(
            color: AsphaltColor.blue40,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        )
      ],
    )
  );
  
  return list;
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
