import 'package:flutter/material.dart';

class NudeButton extends StatelessWidget {
  String buttonText;
  Color textColor;
  double width;
  double height;
  void Function() callback;

  NudeButton({
    @required this.buttonText, this.textColor, this.width, this.height, this.callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
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
      )
    );
  }
}