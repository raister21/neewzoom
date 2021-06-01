import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class CountryDropDown extends StatefulWidget {
  @override
  _CountryDropDownState createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  UIconstants uIconstants = UIconstants();
  late double height, width, xPosition, yPosition;
  bool isDropDownOpen = false;
  GlobalKey actionKey = GlobalKey();
  late OverlayEntry dropDownCountryCode;

  @override
  void initState() {
    super.initState();
  }

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: uIconstants.defaultsmallPads / 2),
              child: Image(
                height: 14,
                image: AssetImage('assets/image/nepalFlag.png'),
              ),
            ),
            Text(
              "+977",
              style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: uIconstants.defaultFontColor,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.arrow_drop_down,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropDown() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: uIconstants.defaultsmallPads / 2),
                    child: Image(
                      height: 14,
                      image: AssetImage('assets/image/nepalFlag.png'),
                    ),
                  ),
                  Text(
                    '+977',
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        color: uIconstants.defaultFontColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
