import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/resources/group_api.dart';
import 'package:hepengta/src/ui/components/homes/group_card_home.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:hepengta/src/ui/pages/all_group_page.dart';
import 'no_group_card.dart';

class ListHorizontalGroupCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListHorizontalGroupCardState();
  }
}

class _ListHorizontalGroupCardState extends State<ListHorizontalGroupCard> {
  var groupApi = GroupApi();

  List<Color> colors = [AsphaltColor.orange50, AsphaltColor.green50, AsphaltColor.blue50];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
            child: FlatButton(
              child: Text("Show all"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllGroupPage())
                );
              },
            ),
          ),
          Container(
            height: 205,
            child: FutureBuilder(
              future: groupApi.getGroups(4),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  if(snapshot.data.length > 0) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        int idx = colors.length % 2;
                        return GroupCardHome(data: snapshot.data[index], color: AsphaltColor.orange50);
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
        ],
      )
    );
  }
}
