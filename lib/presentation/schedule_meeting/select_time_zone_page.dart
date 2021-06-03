import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class SelectTimeZonePage extends StatelessWidget {
  SelectTimeZonePage({Key? key}) : super(key: key);
  final UIconstants uIconstants = UIconstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _selectTimeZoneView());
  }

  Widget _selectTimeZoneView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [_headerBar(), _searchInput(), _timeZoneList()],
      ),
    );
  }

  Widget _headerBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: uIconstants.defaultIconPads, vertical: 20.5),
      child: Row(
        children: [
          Align(
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
          Text(
            "Select Time Zone",
            style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: uIconstants.defaultFontColor),
          )
        ],
      ),
    );
  }

  Widget _searchInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads,
          horizontal: uIconstants.defaultPads),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: uIconstants.defaultBackGroundColor),
          borderRadius: BorderRadius.all(
            Radius.circular(uIconstants.defaultInputBorderRadius),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: uIconstants.defaultsmallPads),
          child: TextField(
            showCursor: false,
            style: TextStyle(
              fontFamily: 'WorkSans',
              color: uIconstants.defaultFontColor,
            ),
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _timeZoneList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: uIconstants.defaultPads,
                  vertical: uIconstants.defaultsmallPads),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: uIconstants.defaultBackGroundColor,
                          width: 1))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Midway Island",
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        height: 1.3,
                        color: uIconstants.defaultFontColor),
                  ),
                  Text(
                    "GMT - 11:00",
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 14,
                      height: 1.3,
                      color: uIconstants.defaultDarkBackground,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
