import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepengta/src/ui/components/notifications/new_notification_card.dart';
import 'package:hepengta/src/ui/components/notifications/old_notification_card.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF2F4F5),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            NewNotificationCard(),
            OldNotificationCard(
              message: "Your request to join Bali Trip has been approved! Let’s put your first deposit!",
              time: "Yesterday",
            ),
            OldNotificationCard(
              message: "Sorry, Maria Marselina rejected your request to join Photography Workshop group.",
              time: "02 June 2019",
            ),
            OldNotificationCard(
              message: "You’ve accepted Imdaad Loopis request to join your group Arisan!",
              time: "23 Jan 2019",
            )
          ],
        ),
      ),
    );
  }
}