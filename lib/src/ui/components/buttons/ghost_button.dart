import 'package:flutter/material.dart';

class GhostButton extends StatelessWidget {
  String buttonText;
  Color textColor;
  double height;
  double width;
  void Function() callback;

  GhostButton({
    @required this.buttonText, this.textColor, this.width, this.height, this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.all(16),
      child: FlatButton(
        onPressed: this.callback,
        child: Text(
          this.buttonText.toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            color: this.textColor,
            fontFamily: "NeoSans"
          ),
        ),
        color: Colors.transparent,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: this.textColor
        ),
        borderRadius: BorderRadius.all(Radius.circular(2))
      ),
    );
  }
}