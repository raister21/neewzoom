import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class RepeatPage extends StatelessWidget {
  RepeatPage({Key? key}) : super(key: key);
  final UIconstants uIconstants = UIconstants();

  List<String> _repeatOptions = [
    "Never",
    "Every Day",
    "Every Week",
    "Every 2 Weeks",
    "Every Month",
    "Every Year"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _repeatView(),
    );
  }

  Widget _repeatView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [_headerBar(), _repeatList()],
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
            "Repeat",
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

  Widget _repeatList() {
    return Expanded(
      child: ListView.builder(
          itemCount: _repeatOptions.length,
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
                    _repeatOptions[index],
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        height: 1.3,
                        color: uIconstants.defaultFontColor),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
