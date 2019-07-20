import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/components/buttons/filled_button.dart';
import 'package:hepengta/src/ui/components/buttons/ghost_button.dart';
import 'package:hepengta/src/ui/components/buttons/nude_button.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:hepengta/src/ui/pages/create_group_page.dart';

class NoGroupCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoGroupCardState();
  }
}

class _NoGroupCardState extends State<NoGroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(5),
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have no group yet, let's create or join"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GhostButton(
                    buttonText: "Create",
                    textColor: AsphaltColor.green50,
                    width: 100,
                    height: 40,
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateGroupPage())
                      );
                    },
                  ),
                  FilledButton(
                    buttonText: "Join",
                    textColor: AsphaltColor.green50,
                    width: 100,
                    height: 40,
                    callback: () {
                      showDialog<Null>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Insert Group Key'),
                            content: TextField(
                              textAlign: TextAlign.center,
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (text) {
                                text.toUpperCase();
                              },
                            ),
                            actions: <Widget>[
                              NudeButton(
                                buttonText: "Close",
                                textColor: AsphaltColor.red50,
                                width: 80,
                                height: 20,
                                callback: () {
                                  Navigator.pop(context);
                                },
                              ),
                              NudeButton(
                                buttonText: "Search",
                                textColor: AsphaltColor.green50,
                                width: 80,
                                height: 20,
                                callback: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        }
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
