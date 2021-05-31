import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final UIconstants uIconstants = UIconstants();
  late int _count;
  late String _verificationCode;

  @override
  void initState() {
    _count = 0;
    _verificationCode = "";

    // focusNodes[_count].requestFocus();
    super.initState();
  }

  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  bool _isVerificationCodeValid() {
    for (var controller in textControllers) {
      if (controller.text == null) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _otpVerificationView(),
    );
  }

  Widget _otpVerificationView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [_headerBar(), _bodyBlock()],
      ),
    );
  }

  Widget _headerBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: uIconstants.defaultIconPads, vertical: 20.5),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: IconButton(
          splashRadius: 15,
          iconSize: 15,
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _bodyBlock() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          uIconstants.defaultPads, 0, uIconstants.defaultPads, 0),
      child: Column(
        children: [
          _disclaimerMessage(),
          _codeInputBar(),
          _verifyButton(),
          _failureMessage(),
        ],
      ),
    );
  }

  Widget _disclaimerMessage() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, uIconstants.defaultsmallPads * 2),
      child: Text(
        "Check your SMS messages for your OTP",
        style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 14,
            height: 1.3,
            color: uIconstants.defaultFontColor),
      ),
    );
  }

  Widget _codeInputBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _codeInput(focusNodes[0], textControllers[0]),
        _codeInput(focusNodes[1], textControllers[1]),
        _codeInput(focusNodes[2], textControllers[2]),
        _codeInput(focusNodes[3], textControllers[3]),
      ],
    );
  }

  Widget _codeInput(FocusNode _focus, TextEditingController _controller) {
    return Container(
      height: 70,
      width: 60,
      decoration: BoxDecoration(
          color: uIconstants.defaultBackGroundColor,
          borderRadius:
              BorderRadius.circular(uIconstants.defaultInputBorderRadius)),
      child: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          focusNode: _focus,
          controller: _controller,
          decoration: InputDecoration(
              counterText: "",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
          onChanged: (value) {
            if (value.length > 0 && _count < 3) {
              setState(() {
                _count++;
              });
              focusNodes[_count].requestFocus();
            }
          },
          showCursor: false,
          maxLength: 1,
        ),
      ),
    );
  }

  Widget _verifyButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, uIconstants.defaultsmallPads * 2, 0,
          uIconstants.defaultsmallPads + 4),
      child: Container(
        height: uIconstants.defaultButtonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(uIconstants.defaultInputBorderRadius),
            )),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Verify",
            style: TextStyle(
                fontFamily: 'WorkSans',
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget _failureMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn’t receive the OTP code?",
          style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              color: uIconstants.defaultFontColor),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Resend",
              style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ))
      ],
    );
  }
}
