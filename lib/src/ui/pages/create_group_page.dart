import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/models/group_card_data.dart';
import 'package:hepengta/src/resources/group_api.dart';
import 'package:hepengta/src/ui/components/buttons/filled_button.dart';
import 'package:hepengta/src/ui/components/buttons/ghost_button.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:hepengta/src/ui/pages/set_group_detail.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateGroupPageState();
  }
}

class _CreateGroupPageState extends State<CreateGroupPage> {

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Group Goal",
          style: TextStyle(
            fontSize: 17
          ),
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
              color: Color(0xFF003D79),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi, Eko",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23
                    ),
                  ),
                  Text(
                    "Anything you want \nto save for?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Create new Goal",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666E80)
                    ),
                  ),
                  Divider(),
                  Text(
                    "Group Goal",
                    style: TextStyle(
                      color: Color(0xFF666E80)
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  Text(
                    "Group Target Amount",
                    style: TextStyle(
                      color: Color(0xFF666E80)
                    ),
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FilledButton(
                        buttonText: "Set Group Goal",
                        textColor: Color(0xFF67B2E8),
                        width: 300,
                        height: 49,
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SetGroupDetail(nameController.text, amountController.text))
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
