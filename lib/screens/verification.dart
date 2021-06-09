import 'package:flutter/material.dart';
import 'package:otp_app/screens/number.dart';
import 'package:otp_app/screens/profile.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:otp_app/constants.dart';
import 'package:otp_app/components/reusable_Button.dart';

class VerificationScreen extends StatefulWidget {
  static const String id = 'verification_screen';
  final String phone;
  VerificationScreen(this.phone);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _verificationCode;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Color(0xFF93D2F3),
    borderRadius: BorderRadius.circular(0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF3C3D43),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, NumberScreen.id);
            }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Verify Phone',
                style: kPageTitleTextStyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Code is sent to +91-${widget.phone}",
              style: kPageSubtitleTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: OtpBox(
                  pinPutFocusNode: _pinPutFocusNode,
                  pinPutController: _pinPutController,
                  pinPutDecoration: pinPutDecoration),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Didn't receive the code?",
                          style: kResendOtpTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextButton(
                            onPressed: () {
                              _verifyPhone();
                            },
                            child: Text(
                              'Request Again',
                              style: TextStyle(
                                  color: Color(0xFF2E3B62),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ReusableButton(
                  width: double.infinity,
                  height: 60,
                  buttonText: "VERIFY AND CONTINUE",
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode,
                              smsCode: _pinPutController.text))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                              (route) => false);
                        }
                      });
                    } catch (e) {
                      Alert(
                              context: context,
                              title: 'Wrong otp!',
                              desc: 'Please re-renter')
                          .show();
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                  (route) => false);
              print('User Logged in');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int resendToken) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({
    Key key,
    @required FocusNode pinPutFocusNode,
    @required TextEditingController pinPutController,
    @required this.pinPutDecoration,
  })  : _pinPutFocusNode = pinPutFocusNode,
        _pinPutController = pinPutController,
        super(key: key);

  final FocusNode _pinPutFocusNode;
  final TextEditingController _pinPutController;
  final BoxDecoration pinPutDecoration;

  @override
  Widget build(BuildContext context) {
    return PinPut(
      fieldsCount: 6,
      withCursor: true,
      textStyle: TextStyle(fontSize: 25.0, color: Colors.white),
      eachFieldWidth: 40.0,
      eachFieldHeight: 55.0,
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.fade,
    );
  }
}
