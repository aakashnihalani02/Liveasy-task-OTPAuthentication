import 'package:flutter/material.dart';
import 'package:otp_app/components/reusable_listTile.dart';
import 'package:otp_app/constants.dart';
import 'package:otp_app/components/reusable_Button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Profile { shipper, transporter }

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile _profile = Profile.shipper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Please select your profile',
                  style: kPageTitleTextStyle,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                width: 325,
                height: 102,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                          splashRadius: 20,
                          activeColor: Color(0xFF2E3B62),
                          value: Profile.shipper,
                          groupValue: _profile,
                          onChanged: (Profile value) {
                            setState(() {
                              _profile = value;
                            });
                          }),
                    ),
                    ReusableListTile(
                      image: 'images/Shipper.jpg',
                      titleText: 'Shipper',
                      subtitleText: "Lorem ipsum dolor sit amet, \n "
                          "consectetur adipiscing",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 325,
                height: 102,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                          splashRadius: 20,
                          activeColor: Color(0xFF2E3B62),
                          value: Profile.transporter,
                          groupValue: _profile,
                          onChanged: (Profile value) {
                            setState(() {
                              _profile = value;
                            });
                          }),
                    ),
                    ReusableListTile(
                      image: 'images/Truck.jpg',
                      titleText: 'Transporter',
                      subtitleText: "Lorem ipsum dolor sit amet, \n consectetur"
                          " adipiscing",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 13, right: 13),
                  child: ReusableButton(
                    width: double.infinity,
                    height: 60,
                    buttonText: "CONTINUE",
                    onPressed: () {
                      Alert(
                              context: context,
                              title: 'Thank you for registering!',
                              desc: 'Please wait for us to review.')
                          .show();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
