import 'package:flutter/material.dart';

class ReusableListTile extends StatelessWidget {
  final String image;
  final String titleText;
  final String subtitleText;
  ReusableListTile({this.image, this.subtitleText, this.titleText});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 40,
            minHeight: 40,
            maxWidth: 60,
            maxHeight: 60,
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 10,
          ),
        ),
        title: Text(
          titleText,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          subtitleText,
        ),
      ),
    );
  }
}
