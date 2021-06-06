import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/custome_widgets/avatars_stack.dart';
import 'package:neewzoom/data/models/dailyMeetings.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({Key? key}) : super(key: key);

  @override
  _MeetingsPageState createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  final UIconstants uIconstants = UIconstants();
  // Dummy data
  List<String> _avatars = [
    'assets/image/demo_profile.png',
    'assets/image/demo_profile.png',
    'assets/image/demo_profile.png',
    'assets/image/demo_profile.png',
    'assets/image/demo_profile.png',
  ];

  Widget _getButtonIfAvailable(bool available) {
    return available
        ? GestureDetector(
            onTap: () {
              print("Clicked");
            },
            child: Container(
              padding:
                  EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                color: uIconstants.defaultPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _meetingsPageView());
  }

  Widget _meetingsPageView() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _headerBar(),
            _meetingControlBlock(),
            _dayTitle("Today"),
            _meetingsCard(
                title: "Daily Standup Meeting",
                id: "Meeting ID: 239 0343 9087",
                hours: "2 hours",
                startable: true),
            _meetingsCard(
                title: "Daily Standup Meeting",
                id: "Meeting ID: 239 0343 9087",
                hours: "6:00 pm",
                startable: false),
            _dayTitle("Tomorrow"),
            _meetingsCard(
                title: "Daily Standup Meeting",
                id: "Meeting ID: 239 0343 9087",
                hours: "2 hours",
                startable: true),
            _meetingsCard(
                title: "Daily Standup Meeting",
                id: "Meeting ID: 239 0343 9087",
                hours: "6:00 pm",
                startable: false),
            _dayTitle("May 19"),
            _meetingsCard(
                title: "Daily Standup Meeting",
                id: "Meeting ID: 239 0343 9087",
                hours: "2 hours",
                startable: true),
          ],
        ),
      ),
    );
  }

  Widget _headerBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: uIconstants.defaultIconPads, vertical: 20.5),
      child: Center(
        child: Text(
          "Meetings",
          style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: uIconstants.defaultFontColor),
        ),
      ),
    );
  }

  Widget _meetingControlBlock() {
    return Padding(
      padding: EdgeInsets.all(uIconstants.defaultPads),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: uIconstants.defaultBackGroundColor),
          borderRadius: BorderRadius.all(
            Radius.circular(uIconstants.defaultInputBorderRadius),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Personal Meeting Id",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    height: 1.3,
                    color: uIconstants.defaultFontColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "9340 439 1342",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    height: 1.8,
                    fontWeight: FontWeight.w600,
                    color: uIconstants.defaultFontColor),
              ),
            ),
            _controllButtonBar(),
          ],
        ),
      ),
    );
  }

  Widget _controllButtonBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: uIconstants.defaultsmallPads,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: Container(
              height: uIconstants.defaultButtonHeight - 10,
              width: MediaQuery.of(context).size.width / 3 -
                  3 * uIconstants.defaultsmallPads,
              decoration: BoxDecoration(
                color: uIconstants.defaultPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: uIconstants.defaultButtonHeight - 10,
              width: MediaQuery.of(context).size.width / 3 -
                  3 * uIconstants.defaultsmallPads,
              decoration: BoxDecoration(
                color: uIconstants.defaultPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  "Invite",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: uIconstants.defaultButtonHeight - 10,
              width: MediaQuery.of(context).size.width / 3 -
                  3 * uIconstants.defaultsmallPads,
              decoration: BoxDecoration(
                color: uIconstants.defaultPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(uIconstants.defaultInputBorderRadius),
                ),
              ),
              child: Center(
                child: Text(
                  "Edit",
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

  Widget _dayTitle(String day) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: uIconstants.defaultsmallPads,
            horizontal: uIconstants.defaultPads),
        child: Text(
          day,
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: uIconstants.defaultDarkBackground,
          ),
        ),
      ),
    );
  }

  Widget _meetingsCard(
      {required String title,
      required String id,
      required String hours,
      required bool startable}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: uIconstants.defaultPads, vertical: 4.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(uIconstants.defaultsmallPads + 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: uIconstants.defaultFontColor,
                    ),
                  ),
                  Text(
                    hours,
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: uIconstants.defaultDarkBackground,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  id,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    height: 1.3,
                    color: uIconstants.defaultFontColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: uIconstants.defaultPads),
                    child: AvatarsStack(
                      listOfAvatars: _avatars,
                    ),
                  ),
                  _getButtonIfAvailable(startable),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
