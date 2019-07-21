import 'package:flutter/material.dart';

class HeaderCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeaderCardState();
  }
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                  ),
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      color: Color(0xFFACB2BF),
                      fontSize: 16
                    ),
                  ),
                  Image.asset(
                    "assets/images/visa.png",
                    height: 30,
                  )
                ],
              ),
              Text(
                "IDR 2,134,674",
                style: TextStyle(
                  color: Color(0xFF003D79),
                  fontWeight: FontWeight.w900,
                  fontSize: 27,
                ),
              ),
              Text(
                "**** **** **** 6108",
                style: TextStyle(
                  color: Color(0xFFACB2BF),
                  fontSize: 16
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Eko Simanjuntak",
                    style: TextStyle(
                      color: Color(0xFFACB2BF),
                      fontSize: 16
                    )
                  ),
                  Text(
                    "08 / 23",
                    style: TextStyle(
                      color: Color(0xFFACB2BF),
                      fontSize: 16
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}
