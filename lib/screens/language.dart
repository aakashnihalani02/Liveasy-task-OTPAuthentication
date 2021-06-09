import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_app/screens/number.dart';
import 'package:otp_app/constants.dart';
import 'package:otp_app/components/reusable_Button.dart';
import 'package:otp_app/page_transitions.dart';

class LanguageScreen extends StatefulWidget {
  static const String id = 'language_screen';

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "images/backgroundimage1.jpg",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Please select your Language',
                  style: kPageTitleTextStyle),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You can change the language \n                at any time.',
              style: kPageSubtitleTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF494A50),
                ),
              ),
              width: 225,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: DropdownButtonFormField(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 25,
                style: const TextStyle(color: Color(0xFF9C9C9C)),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['English', 'Hindi', 'Arabic', 'Spanish']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        value,
                        style:
                            TextStyle(color: Color(0xFF494A50), fontSize: 17),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ReusableButton(
                width: 225,
                height: 47,
                buttonText: 'NEXT',
                onPressed: () {
                  Navigator.push(
                      context, SlideRightRoute(page: NumberScreen()));
                }),
          ],
        ),
      ]),
    );
  }
}
