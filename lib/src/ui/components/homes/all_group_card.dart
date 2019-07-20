import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/components/buttons/nude_button.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:hepengta/src/ui/pages/all_group_page.dart';

class AllGroupCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllGroupCardState();
  }
}

class _AllGroupCardState extends State<AllGroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.all(5),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NudeButton(
                buttonText: "See all group",
                textColor: AsphaltColor.orange50,
                height: 40,
                width: 200,
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllGroupPage())
                  );
                },
              )
            ],
          ),
        ),
      )
    );
  }
}
