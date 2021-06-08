import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class SearchNameEmailPage extends StatefulWidget {
  const SearchNameEmailPage({Key? key}) : super(key: key);

  @override
  _SearchNameEmailPageState createState() => _SearchNameEmailPageState();
}

class _SearchNameEmailPageState extends State<SearchNameEmailPage> {
  UIconstants uIconstants = UIconstants();

  //Dummy data
  List<String> suggestedPeople = ["Jimmiy Hendrix", "John mayer", "Elton John"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _searchNameEmailView());
  }

  Widget _searchNameEmailView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_headerBar(), _suggestedTitle(), _suggestedPeople()],
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
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontFamily: 'WorkSans',
                color: uIconstants.defaultFontColor,
              ),
              decoration: InputDecoration(
                hintText: "Search by name or email",
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _suggestedTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads,
          horizontal: uIconstants.defaultPads),
      child: Text(
        "Suggested",
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: uIconstants.defaultDarkBackground,
        ),
      ),
    );
  }

  Widget _suggestedPeople() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads,
          horizontal: uIconstants.defaultPads),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: suggestedPeople.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage:
                        AssetImage('./assets/image/demo_profile.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: uIconstants.defaultsmallPads,
                    ),
                    child: Text(
                      suggestedPeople[index],
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        color: uIconstants.defaultDarkBackground,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
