import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/data/OTP/bloc/otp_bloc.dart';
import 'package:neewzoom/presentation/custome_widgets/country_drop_down.dart';
import 'package:neewzoom/presentation/otp_verification.dart';

class OtpPhoneNumberPage extends StatefulWidget {
  @override
  _OtpPhoneNumberPageState createState() => _OtpPhoneNumberPageState();
}

class _OtpPhoneNumberPageState extends State<OtpPhoneNumberPage> {
  final UIconstants uIconstants = UIconstants();
  final TextEditingController _phoneNumberController = TextEditingController();
  final CountryDropDown countryDropDown = CountryDropDown();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _otpPhoneNumberView());
  }

  Widget _otpPhoneNumberView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _headerBar(),
          _bodyBlock(),
        ],
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
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
        child: Column(
          children: [
            _disclaimerMessage(),
            _phoneNumberBlock(),
            _getOTPbutton(),
          ],
        ),
      ),
    );
  }

  Widget _disclaimerMessage() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, uIconstants.defaultsmallPads, 0, 0),
      child: Text(
        "We will send you One Time Code on your phone number.",
        style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 14,
            height: 1.3,
            color: uIconstants.defaultFontColor),
      ),
    );
  }

  Widget _phoneNumberBlock() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, uIconstants.defaultsmallPads * 2, 0, 0),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(0, 0, 0, uIconstants.defaultsmallPads - 4),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Phone number",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: uIconstants.defaultFontColor),
              ),
            ),
          ),
          _phoneNumberInput(),
        ],
      ),
    );
  }

  Widget _phoneNumberInput() {
    return Container(
      decoration: BoxDecoration(
        color: uIconstants.defaultBackGroundColor,
        border: Border.all(
          color: uIconstants.defaultBackGroundColor,
          width: uIconstants.defaultBorderWidth,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(uIconstants.defaultInputBorderRadius),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: countryDropDown,
          ),
          Expanded(
            flex: 7,
            child: _inputNumber(),
          ),
        ],
      ),
    );
  }

  Widget _inputNumber() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(uIconstants.defaultInputBorderRadius),
          bottomRight: Radius.circular(uIconstants.defaultInputBorderRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultsmallPads),
        child: TextField(
          controller: _phoneNumberController,
          showCursor: false,
          style: TextStyle(
              fontFamily: 'WorkSans',
              color: uIconstants.defaultFontColor,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
              focusedBorder: InputBorder.none, border: InputBorder.none),
          keyboardType: TextInputType.phone,
          onChanged: (value) => {
            if (value.isNotEmpty)
              {
                BlocProvider.of<OtpBloc>(context)
                    .add(OtpPhoneNumberChanged(phoneNumber: int.parse(value)))
              }
          },
        ),
      ),
    );
  }

  // Widget _internationalNumberDropDown() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.symmetric(
  //             horizontal: uIconstants.defaultsmallPads / 2),
  //         child: Image(
  //           height: 14,
  //           image: AssetImage('assets/image/nepalFlag.png'),
  //         ),
  //       ),
  //       Text(
  //         "+977",
  //         style: TextStyle(
  //             fontFamily: 'WorkSans',
  //             color: uIconstants.defaultFontColor,
  //             fontWeight: FontWeight.w700),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           print("clicked");
  //         },
  //         child: Icon(Icons.arrow_drop_down),
  //       ),
  //     ],
  //   );
  // }

  Widget _getOTPbutton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads * 2),
      child: Container(
        height: uIconstants.defaultButtonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(uIconstants.defaultInputBorderRadius),
            )),
        child: TextButton(
          onPressed: () {
            BlocProvider.of<OtpBloc>(context).add(OtpPhoneNumberSubmit(
                countryCode: "+977",
                phoneNumber: int.parse(_phoneNumberController.text)));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OTPVerificationPage()));
          },
          child: Text(
            "Get OTP",
            style: TextStyle(
                fontFamily: 'WorkSans',
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
