import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/resources/group_api.dart';
import 'package:hepengta/src/ui/components/homes/group_card.dart';
import 'package:hepengta/src/ui/components/homes/no_group_card.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:hepengta/src/ui/pages/create_group_page.dart';

import 'join_page.dart';

class AllGroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllGroupPageState();
  }
}

class _AllGroupPageState extends State<AllGroupPage>{
  var groupApi = GroupApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Groups",
          style: TextStyle(
            fontSize: 18
          )
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF2F4F5),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/join_icon.png",
                            width: 38,
                          ),
                          Text(
                            "Join Group",
                            style: TextStyle(
                              color: AsphaltColor.blue40
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JoinPage())
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_circle,
                            color: AsphaltColor.blue40,
                            size: 40,
                          ),
                          Text(
                            "Create new Goal",
                            style: TextStyle(
                              color: AsphaltColor.blue40
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateGroupPage())
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 535,
              child: FutureBuilder(
                future: groupApi.getGroups(100),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    if(snapshot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GroupCard(data: snapshot.data[index], color: AsphaltColor.orange50);
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
      )
    );
  }
}
