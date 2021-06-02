import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/data/OTP/bloc/otp_bloc.dart';
import 'package:neewzoom/custome_widgets/country_drop_down.dart';
import 'package:neewzoom/presentation/otp_verification.dart';

class OtpPhoneNumberPage extends StatefulWidget {
  @override
  _OtpPhoneNumberPageState createState() => _OtpPhoneNumberPageState();
}

class _OtpPhoneNumberPageState extends State<OtpPhoneNumberPage> {
  final UIconstants uIconstants = UIconstants();
  final TextEditingController _phoneNumberController = TextEditingController();
  late CountryDropDown countryDropDown;
  final _dropDownKey = GlobalKey<CountryDropDownState>();

  void _countryChanged({country, flag}) {
    BlocProvider.of<OtpBloc>(context)
        .add(OtpCountryCodeChanged(countryCode: country, countryFlag: flag));
  }

  @override
  void initState() {
    countryDropDown = CountryDropDown(
      key: _dropDownKey,
      countryChanged: (String country, String flag) => {
        _countryChanged(country: country, flag: flag),
      },
    );

    super.initState();
  }

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
          Expanded(flex: 3, child: countryDropDown),
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
        child: BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                if (_phoneNumberController.text.isNotEmpty) {
                  BlocProvider.of<OtpBloc>(context).add(OtpPhoneNumberSubmit(
                      countryCode: state.countryCode ?? "+977",
                      phoneNumber: int.parse(_phoneNumberController.text)));
                  _dropDownKey.currentState!.removeDropDown();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OTPVerificationPage()));
                } else {}
              },
              child: Text(
                "Get OTP",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            );
          },
        ),
      ),
    );
  }
}
