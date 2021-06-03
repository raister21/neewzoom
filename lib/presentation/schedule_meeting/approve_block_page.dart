import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class ApproveBlockPage extends StatefulWidget {
  ApproveBlockPage({Key? key}) : super(key: key);

  @override
  _ApproveBlockPageState createState() => _ApproveBlockPageState();
}

class _ApproveBlockPageState extends State<ApproveBlockPage> {
  final UIconstants uIconstants = UIconstants();

  List<String> _allowedOptions = [
    "None",
    "Only allow users from selected countries/regions",
    "Block users from selected countries/regions"
  ];

  List<String> _regionOptions = [
    "Nepal",
    "New Zealand",
    "Japan",
    "Laos",
    "Puerto Rico",
    "Vatican City",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _approveBlockView(),
    );
  }

  Widget _approveBlockView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _headerBar(),
          _approveList(),
          _selectedRegionInput(),
          _quickCountriesList()
        ],
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
            "Approve or Block Entry",
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

  // Widget _approveList2() {
  //   return Column(
  //     children: [
  //       _textBlock(_regionOptions[0]),
  //       _textBlock(_regionOptions[1]),
  //       _textBlock(_regionOptions[2]),
  //       _textBlock(_regionOptions[3]),
  //       _textBlock(_regionOptions[4]),
  //       _textBlock(_regionOptions[5]),
  //     ],
  //   );
  // }

  // Widget _textBlock(String text) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     padding: EdgeInsets.symmetric(
  //         horizontal: uIconstants.defaultPads,
  //         vertical: uIconstants.defaultsmallPads),
  //     decoration: BoxDecoration(
  //         border: Border(
  //             bottom: BorderSide(
  //                 color: uIconstants.defaultBackGroundColor, width: 1))),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           text,
  //           style: TextStyle(
  //             fontFamily: 'WorkSans',
  //             fontSize: 16,
  //             height: 1.3,
  //             color: uIconstants.defaultFontColor,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _approveList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _allowedOptions.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: uIconstants.defaultPads,
                vertical: uIconstants.defaultsmallPads),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: uIconstants.defaultBackGroundColor, width: 1))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _allowedOptions[index],
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16,
                      height: 1.3,
                      color: uIconstants.defaultFontColor),
                ),
              ],
            ),
          );
        });
  }

  Widget _selectedRegionInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads + 4,
          horizontal: uIconstants.defaultPads),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SELECTED COUNTRIES/REGIONS",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 16,
              height: 1.3,
              fontWeight: FontWeight.bold,
              color: uIconstants.defaultDarkBackground,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: uIconstants.defaultBackGroundColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: uIconstants.defaultsmallPads),
                child: TextField(
                  showCursor: false,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    color: uIconstants.defaultFontColor,
                  ),
                  decoration: InputDecoration(
                    hintText: "Countries/Regions",
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: uIconstants.defaultFontColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickCountriesList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: _regionOptions.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: uIconstants.defaultPads,
                vertical: uIconstants.defaultsmallPads),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: uIconstants.defaultBackGroundColor, width: 1))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _regionOptions[index],
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16,
                      height: 1.3,
                      color: uIconstants.defaultFontColor),
                ),
              ],
            ),
          );
        });
  }
}
