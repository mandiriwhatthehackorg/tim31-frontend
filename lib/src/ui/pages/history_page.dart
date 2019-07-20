import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/models/history.dart';
import 'package:hepengta/src/resources/transactions_api.dart';
import 'package:hepengta/src/ui/components/homes/history_tile.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {

  var transactionApi = TransactionApi();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History in " + DateTime.now().year.toString()),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: buildInOutList(),
        ),
      )
    );
  }

  List<Widget> buildInOutList() {
    List<Widget> list = List<Widget>();
    List<String> months = ["", "January", "Februari", "March", "April", "May", "June", "July", "August", "September", "October", "November", "Descember"];

    Map<String, List<History>> historiesPerMonth = Map<String, List<History>>();
    historiesPerMonth["June"] = [
      History(title: "Arisan Gang Sentosa", user: "Eko", date: "01 June 2019", amount: "50.000", isOut: true),
      History(title: "Beli Sepeda Motor", user: "Eko", date: "11 June 2019", amount: "200.000", isOut: true),
      History(title: "Topup Mandiri", user: "Eko", date: "27 June 2019", amount: "350.000", isOut: false),
    ];

    for(var i=12; i > 0; i--) {
      if(i > DateTime.now().month) {
        continue;
      }

//     var res = await this.transactionApi.getTransactions(100, i).then((res) => {
//        if(res.length > 0) {
//          print(res[0].date),
//          list.add(
//            Text("Asdas")
//          )
//        } else {
//          list.add(
//            Row(
//              children: <Widget>[
//                Text(
//                  months[i],
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold
//                  ),
//                ),
//                Text(
//                  " no transaction",
//                  style: TextStyle(
//                    fontStyle: FontStyle.italic
//                  ),
//                )
//              ]
//             )
//          )
//        }
//      });

      var historyInMonth = historiesPerMonth[months[i]];

      list.add(
        Row(
          children: <Widget>[
            Text(
              months[i],
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            historyInMonth == null ? Text(
              " no transaction",
              style: TextStyle(
                fontStyle: FontStyle.italic
              ),
            ): Container(),
          ],
        )
      );

      if(historyInMonth != null) {
        for(var j=0; j<historyInMonth.length; j++) {
          list.add(
            Container(
              padding: EdgeInsets.only(left: 10),
              child: HistoryTile(history: historyInMonth[j]),
            )
          );
        }
      }

      list.add(Divider(color: Colors.transparent, height: 15));
    }

    return list;
  }
}

