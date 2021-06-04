import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/data/models/region_list.dart';

class SelectRegionPage extends StatefulWidget {
  SelectRegionPage({Key? key}) : super(key: key);

  @override
  _SelectRegionPageState createState() => _SelectRegionPageState();
}

class _SelectRegionPageState extends State<SelectRegionPage> {
  final UIconstants uIconstants = UIconstants();

  List<RegionList> _regionOptions = [
    RegionList(alphabet: "A", regions: ["Australia", "Austria", "Albania"]),
    RegionList(alphabet: "B", regions: ["Boliva"]),
    RegionList(alphabet: "C", regions: ["China", "Cyprus", "Chile"]),
    RegionList(alphabet: "D", regions: ["Denmark"]),
    RegionList(alphabet: "E", regions: ["England", "Ethopia"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _selectRegionView());
  }

  Widget _selectRegionView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [_contentBlock(), _selectionButtonBar()],
      ),
    );
  }

  Widget _contentBlock() {
    return Expanded(
      child: Container(
        child: Column(
          children: [_headerBar(), _searchInput(), _regionList()],
        ),
      ),
    );
  }

  Widget _selectionButtonBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads,
          horizontal: uIconstants.defaultPads),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {},
            child: Container(
              height: uIconstants.defaultButtonHeight,
              width: MediaQuery.of(context).size.width / 2 -
                  uIconstants.defaultPads * 2,
              decoration: BoxDecoration(
                border: Border.all(color: uIconstants.defaultPrimaryColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  "Clear Selection",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: uIconstants.defaultPrimaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: uIconstants.defaultButtonHeight,
              width: MediaQuery.of(context).size.width / 2 -
                  uIconstants.defaultPads * 2,
              decoration: BoxDecoration(
                color: uIconstants.defaultPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  "OK",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
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
            "Select Countries/Regions",
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
              hintText: "Search",
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

  Widget _regionList() {
    return Expanded(
      child: ListView.builder(
          itemCount: _regionOptions.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: uIconstants.defaultPads,
                        vertical: uIconstants.defaultsmallPads),
                    child: Text(
                      _regionOptions[index].alphabet,
                      style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontSize: 16,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: uIconstants.defaultFontColor),
                    ),
                  ),
                  _regionsInAlphabet(_regionOptions[index].regions),
                ],
              ),
            );
          }),
    );
  }

  Widget _regionsInAlphabet(List<String> regions) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: regions.length,
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
                  regions[index],
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
