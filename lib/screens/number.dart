import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'verification.dart';
import 'package:otp_app/constants.dart';
import 'package:otp_app/components/reusable_Button.dart';

class NumberScreen extends StatefulWidget {
  static const String id = 'number_screen';

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  bool _validate = false;
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xFF3C3D43),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "images/backgroundimage2.jpg",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text('Please enter your mobile number',
                    style: kPageTitleTextStyle),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You'll receive a 6 digit code \n                to verify "
                "next.",
                style: kPageSubtitleTextStyle,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: double.infinity,
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      errorText: _validate ? 'Please enter your number' : null,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(20),
                      counterText: "",
                      hintText: 'Mobile Number',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          '🇮🇳  +91   -',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: _controller,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // ignore: deprecated_member_use
              Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: ReusableButton(
                    width: double.infinity,
                    height: 60,
                    buttonText: "CONTINUE",
                    onPressed: () {
                      setState(() {
                        _controller.text.isEmpty
                            ? _validate = true
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    VerificationScreen(_controller.text)));
                      });
                    },
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
