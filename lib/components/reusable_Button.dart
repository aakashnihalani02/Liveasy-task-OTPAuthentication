import 'package:flutter/material.dart';
import 'package:otp_app/constants.dart';

class ReusableButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final Function onPressed;
  ReusableButton({this.buttonText, this.height, this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: width,
      height: height,
      onPressed: onPressed,
      color: Color(0xFF2E3B62),
      child: Text(
        buttonText,
        style: kButtonTextStyle,
      ),
    );
  }
}
