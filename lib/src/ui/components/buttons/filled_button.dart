import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  String buttonText;
  Color textColor;
  double width;
  double height;
  void Function() callback;

  FilledButton({
    @required this.buttonText, this.textColor, this.width, this.height, this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      margin: EdgeInsets.all(16),
      child: FlatButton(
        onPressed: this.callback,
        child: Text(
          this.buttonText,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: "NeoSans"
          ),
        ),
        color: this.textColor,
      ),
    );
  }
}