import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/data/models/avatar.dart';

class MeetingsDetailsPage extends StatefulWidget {
  const MeetingsDetailsPage({Key? key}) : super(key: key);

  @override
  _MeetingsDetailsPageState createState() => _MeetingsDetailsPageState();
}

class _MeetingsDetailsPageState extends State<MeetingsDetailsPage> {
  UIconstants uIconstants = UIconstants();

  // Dummy data
  List<Avatar> avatars = [
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "mandip"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "Amish"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "aakrit"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "mandip"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "Amish"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "aakrit"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "mandip"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "Amish"),
    Avatar(imagePath: 'assets/image/demo_profile.png', name: "aakrit"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _meetingsDetailsPageView());
  }

  Widget _meetingsDetailsPageView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_meetingDetailsContent(), _meetingDetailsButton()],
    );
  }

  Widget _meetingDetailsContent() {
    return Column(
      children: [
        _headerBar(),
        _meetingDetailsBlock(
            title: "DAILY STAND UP ",
            date: 'May 12,2021',
            time: "9:00 AM - 9:30 AM",
            id: "9340 439 1342",
            lockCode: "dfd3fff2"),
        _meetingParticipantsBlock(participants: avatars),
      ],
    );
  }

  Widget _headerBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: uIconstants.defaultIconPads, vertical: 20.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              Text(
                "Meeting Details",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: uIconstants.defaultFontColor),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
            child: SvgPicture.asset('assets/icons/PencilSimplepencil.svg'),
          )
        ],
      ),
    );
  }

  Widget _meetingDetailsBlock(
      {required String title,
      required String date,
      required String time,
      required String id,
      required String lockCode}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(uIconstants.defaultPads, 0,
          uIconstants.defaultPads, uIconstants.defaultsmallPads),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: 12,
                  left: uIconstants.defaultPads,
                  right: uIconstants.defaultPads),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: uIconstants.defaultDarkBackground,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: uIconstants.defaultPads),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/CalendarBlankgrey.svg'),
                        Padding(
                          padding: EdgeInsets.only(
                              left: uIconstants.defaultsmallPads),
                          child: Text(
                            date,
                            style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 14,
                              color: uIconstants.defaultFontColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text(
                        "Add to calender",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontSize: 14,
                          color: uIconstants.defaultLinkColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: uIconstants.defaultPads, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/Clockgrey.svg'),
                  Padding(
                    padding:
                        EdgeInsets.only(left: uIconstants.defaultsmallPads),
                    child: Text(
                      time,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                        color: uIconstants.defaultFontColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: uIconstants.defaultPads, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/IdentificationCard.svg'),
                  Padding(
                    padding:
                        EdgeInsets.only(left: uIconstants.defaultsmallPads),
                    child: Text(
                      id,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                        color: uIconstants.defaultFontColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: uIconstants.defaultPads, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/Lock.svg'),
                  Padding(
                    padding:
                        EdgeInsets.only(left: uIconstants.defaultsmallPads),
                    child: Text(
                      lockCode,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                        color: uIconstants.defaultFontColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _meetingParticipantsBlock({
    required List<Avatar> participants,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: uIconstants.defaultPads,
                  left: uIconstants.defaultPads,
                  right: uIconstants.defaultPads),
              child: Text(
                "PARTICIPANTS",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: uIconstants.defaultDarkBackground,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: _listOfParticipants(participants),
              ),
            ),
            _inviteButton(),
          ],
        ),
      ),
    );
  }

  Widget _listOfParticipants(List<Avatar> avatars) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: avatars.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: uIconstants.defaultsmallPads - 4),
            child: SizedBox(
              height: 100,
              width: 50,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(avatars[index].imagePath),
                  ),
                  Text(
                    avatars[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 12,
                      color: uIconstants.defaultFontColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _inviteButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
      child: GestureDetector(
        onTap: () {
          print("Clicked");
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: uIconstants.defaultsmallPads),
          width: MediaQuery.of(context).size.width / 4,
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
    );
  }

  Widget _meetingDetailsButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: uIconstants.defaultPads),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: uIconstants.defaultsmallPads,
                horizontal: uIconstants.defaultPads),
            child: Container(
              height: uIconstants.defaultButtonHeight,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(uIconstants.defaultInputBorderRadius),
                  )),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Start Meeting",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
            child: Container(
              height: uIconstants.defaultButtonHeight,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: uIconstants.defaultPrimaryColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(uIconstants.defaultInputBorderRadius),
                  )),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Delete",
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: uIconstants.defaultPrimaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
