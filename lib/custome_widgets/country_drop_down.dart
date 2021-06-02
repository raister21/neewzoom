import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/data/OTP/bloc/otp_bloc.dart';
import 'package:neewzoom/data/models/country_code.dart';

class CountryDropDown extends StatefulWidget {
  final Function(String, String) countryChanged;

  CountryDropDown({Key? key, required this.countryChanged}) : super(key: key);
  @override
  CountryDropDownState createState() => CountryDropDownState();
}

class CountryDropDownState extends State<CountryDropDown> {
  UIconstants uIconstants = UIconstants();
  late double height, width, xPosition, yPosition;
  bool isDropDownOpen = false;
  GlobalKey actionKey = GlobalKey();
  late OverlayEntry dropDownCountryCode;

  void removeDropDown() {
    if (isDropDownOpen) {
      dropDownCountryCode.remove();
      isDropDownOpen = !isDropDownOpen;
    }
  }

  List<CountryCode> countries = [
    CountryCode(code: "+61", imagePath: "assets/flags/143-australia.svg"),
    CountryCode(code: "+65", imagePath: "assets/flags/132-singapore.svg"),
    CountryCode(code: "+81", imagePath: "assets/flags/241-japan.svg"),
    CountryCode(code: "+88", imagePath: "assets/flags/134-bangladesh.svg"),
    CountryCode(code: "+91", imagePath: "assets/flags/055-india.svg"),
    CountryCode(code: "+977", imagePath: "assets/flags/012-nepal.svg"),
  ];

  OverlayEntry _createFloatingDropDown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition - 1,
        width: width,
        top: height + yPosition,
        height: 8 * height,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
          child: Container(
              decoration: BoxDecoration(
                  color: uIconstants.defaultBackGroundColor,
                  borderRadius: BorderRadius.circular(
                      uIconstants.defaultInputBorderRadius)),
              child: _dropDown()),
        ),
      );
    });
  }

  void _getDropDownData() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropDownOpen) {
            dropDownCountryCode.remove();
          } else {
            _getDropDownData();
            dropDownCountryCode = _createFloatingDropDown();
            Overlay.of(context)!.insert(dropDownCountryCode);
          }
          isDropDownOpen = !isDropDownOpen;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
        child: BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: uIconstants.defaultsmallPads / 2),
                  child: SvgPicture.asset(
                    state.countryFlag ?? 'assets/flags/012-nepal.svg',
                    height: 14,
                  ),
                ),
                Text(
                  state.countryCode ?? "+977",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: uIconstants.defaultFontColor,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.arrow_drop_down,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _dropDown() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemCount: countries.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.countryChanged(
                  countries[index].code, countries[index].imagePath);
              removeDropDown();
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: uIconstants.defaultsmallPads),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: uIconstants.defaultPads),
                      child: SvgPicture.asset(
                        countries[index].imagePath,
                        height: 14,
                      ),
                    ),
                    Text(
                      countries[index].code,
                      style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: uIconstants.defaultFontColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
