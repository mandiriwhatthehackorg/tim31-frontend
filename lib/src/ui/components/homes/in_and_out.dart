import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/models/history.dart';
import 'package:hepengta/src/resources/transactions_api.dart';
import 'package:hepengta/src/ui/components/homes/history_tile.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';

import 'no_group_card.dart';

class InOutList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InOutState();
  }
}

class _InOutState extends State<InOutList> {
  
  var transactionApi = TransactionApi();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _BuildInAndOutList(),
        ),
      ),
    );
  }

  List<Widget> _BuildInAndOutList() {
    List<Widget> list = new List<Widget>();
    List<History> histories = [
//      History(title: "Arisan Gang Sentosa", date: "01 June 2019", amount: "50.000", isOut: true),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Topup Mandiri", date: "27 June 2019", amount: "350.000", isOut: false),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Arisan Gang Sentosa", date: "01 June 2019", amount: "50.000", isOut: true),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Topup Mandiri", date: "27 June 2019", amount: "350.000", isOut: false),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Arisan Gang Sentosa", date: "01 June 2019", amount: "50.000", isOut: true),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Topup Mandiri", date: "27 June 2019", amount: "350.000", isOut: false),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Arisan Gang Sentosa", date: "01 June 2019", amount: "50.000", isOut: true),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
//      History(title: "Topup Mandiri", date: "27 June 2019", amount: "350.000", isOut: false),
//      History(title: "Beli Sepeda Motor", date: "11 June 2019", amount: "200.000", isOut: true),
    ];
  
    list.add(
      Row(
        children: <Widget>[
          Text(
            "Recent Transactions",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      )
    );
  
    list.add(Divider());
  
    list.add(
      Container(
        height: 130,
        child: FutureBuilder(
          future: this.transactionApi.getTransactions(3, 7),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              if(snapshot.data.length > 0) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return HistoryTile(history: snapshot.data[index]);
                  },
                );
              } else {
                return NoGroupCard();
              }
            } else {
              return Text("Something wrong happend");
            }
          },
        ),
      )
    );
  
    for(var i = 0; i < histories.length; i++){
      list.add(HistoryTile(history: histories[i]));
    }
  
    list.add(Divider());
    list.add(
      Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: AsphaltColor.blue40),
          borderRadius: BorderRadius.all(Radius.circular(2))
        ),
        child: FlatButton(
          child: Text(
            "View All",
            style: TextStyle(
              color: AsphaltColor.blue40
            ),
          ),
          onPressed: () {
          
          },
        ),
      )
    );
  
    return list;
  }
}

