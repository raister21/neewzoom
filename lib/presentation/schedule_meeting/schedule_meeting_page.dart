import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class ScheduleMeetingPage extends StatefulWidget {
  const ScheduleMeetingPage({Key? key}) : super(key: key);

  @override
  _ScheduleMeetingPageState createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage> {
  UIconstants uIconstants = UIconstants();
  bool _isUsingPMI = false;
  bool _isPasswordRequired = false;
  bool _isWaitingRoomUnabled = false;
  bool _isAuthenticatedUserAllowed = false;
  bool _isHostVideoOn = false;
  bool _isParticipantVideoOn = false;
  bool _isOnlyAllowAuthenticatedUser = false;
  bool _isAllowParticipantToJoin = false;
  bool _isAutomaticRecording = false;
  bool _isAddToCalender = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _scheduleMeetingView());
  }

  Widget _scheduleMeetingView() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [_contentBlock(), _scheduleMeetingButton()],
      ),
    );
  }

  Widget _contentBlock() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [_headerBar(), _bodyBlock()],
        ),
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
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Text(
            "Schedule Meeting",
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

  Widget _nameInput() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads - 4),
          child: Text(
            "Name",
            style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: uIconstants.defaultFontColor),
          ),
        ),
        Container(
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
                  focusedBorder: InputBorder.none, border: InputBorder.none),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _dateInput() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads - 4),
          child: Text(
            "Date",
            style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: uIconstants.defaultFontColor),
          ),
        ),
        Container(
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
                    child: SvgPicture.asset(
                      'assets/icons/CalendarIcon.svg',
                    ),
                  )),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _startAndEndTimeBar() {
    return Container(
      child: Row(children: [
        _startTimeInput(),
        _endTimeInput(),
      ]),
    );
  }

  Widget _startTimeInput() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: uIconstants.defaultsmallPads,
            right: uIconstants.defaultPads / 2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads - 4),
            child: Text(
              "From",
              style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: uIconstants.defaultFontColor),
            ),
          ),
          Container(
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
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: SvgPicture.asset(
                        'assets/icons/ClockIcon.svg',
                      ),
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _endTimeInput() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: uIconstants.defaultsmallPads,
            left: uIconstants.defaultPads / 2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads - 4),
            child: Text(
              "To",
              style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: uIconstants.defaultFontColor),
            ),
          ),
          Container(
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
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: SvgPicture.asset(
                        'assets/icons/ClockIcon.svg',
                      ),
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _timeZoneSelect() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultPads),
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
              hintText: "Time Zone",
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
    );
  }

  Widget _repeatSelect() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultPads),
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
              hintText: "Repeat",
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
    );
  }

  Widget _scheduleMeetingButton() {
    return Padding(
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
              "Schedule Meeting",
              style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          )),
    );
  }

  Widget _userPersonalIdRadioBtn() {
    return Container(
        child: SwitchListTile(
      contentPadding: EdgeInsets.zero,
      onChanged: (bool value) {
        setState(() {
          _isUsingPMI = value;
        });
      },
      value: _isUsingPMI,
      title: Text("Use Personal Meeting ID (PMI)",
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 14,
            fontWeight: FontWeight.w300,
          )),
      subtitle: Text(
        "333 455 3421",
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 12,
        ),
      ),
    ));
  }

  Widget _securityTitle() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: Text(
        "Schedule Meeting",
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: uIconstants.defaultDarkBackground,
        ),
      ),
    );
  }

  Widget _requireMeetingIdButton() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isPasswordRequired = value;
          });
        },
        value: _isPasswordRequired,
        title: Text("Require Meeting Passcode",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _passwordInput() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads - 4),
          child: Text(
            "Password",
            style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: uIconstants.defaultFontColor),
          ),
        ),
        Container(
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
              obscureText: true,
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
                    child: Icon(Icons.remove_red_eye),
                  )),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _enableWaitingRoomRadioBtn() {
    return Container(
        padding: EdgeInsets.only(top: uIconstants.defaultPads),
        child: SwitchListTile(
          contentPadding: EdgeInsets.zero,
          onChanged: (bool value) {
            setState(() {
              _isWaitingRoomUnabled = value;
            });
          },
          value: _isWaitingRoomUnabled,
          title: Text("Enable Waiting Room",
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 14,
                fontWeight: FontWeight.w300,
              )),
          subtitle: Text(
            "Only users allowed by the host can join the meeting",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 12,
            ),
          ),
        ));
  }

  Widget _allowAuthenticatedUser() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isAuthenticatedUserAllowed = value;
          });
        },
        value: _isAuthenticatedUserAllowed,
        title: Text("Only Allow Authenticated Users",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _meetingOptionTitle() {
    return Padding(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: Text(
        "Meeting Options",
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: uIconstants.defaultDarkBackground,
        ),
      ),
    );
  }

  Widget _hostVideoOnButton() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isHostVideoOn = value;
          });
        },
        value: _isHostVideoOn,
        title: Text("Host Video On",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _participantVideoOnButton() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isParticipantVideoOn = value;
          });
        },
        value: _isParticipantVideoOn,
        title: Text("Participant Video On",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _allowAuthenticatedUserOnly() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isOnlyAllowAuthenticatedUser = value;
          });
        },
        value: _isOnlyAllowAuthenticatedUser,
        title: Text("Only Allow Authenticated Users",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _allowJoinBeforeHostUser() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isAllowParticipantToJoin = value;
          });
        },
        value: _isAllowParticipantToJoin,
        title: Text("Allow Participants to Join Before Host",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _autoRecordMeeting() {
    return Container(
      padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isAutomaticRecording = value;
          });
        },
        value: _isAutomaticRecording,
        title: Text("Automatically Record Meeting",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _regionEntryBox() {
    return Padding(
      padding: EdgeInsets.only(bottom: uIconstants.defaultsmallPads + 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: uIconstants.defaultBackGroundColor),
          borderRadius: BorderRadius.all(
            Radius.circular(uIconstants.defaultInputBorderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    uIconstants.defaultsmallPads,
                    uIconstants.defaultsmallPads,
                    0,
                    uIconstants.defaultsmallPads),
                child: Text(
                  "Approve or Block Entry for Users from Specific Countries / Region",
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: uIconstants.defaultsmallPads,
                    right: uIconstants.defaultsmallPads),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "None",
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: uIconstants.defaultFontColor)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _addToCalenderButton() {
    return Container(
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        onChanged: (bool value) {
          setState(() {
            _isAddToCalender = value;
          });
        },
        value: _isAddToCalender,
        title: Text("Add To Calender",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
      ),
    );
  }

  Widget _bodyBlock() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameInput(),
          _dateInput(),
          _startAndEndTimeBar(),
          _timeZoneSelect(),
          _repeatSelect(),
          _userPersonalIdRadioBtn(),
          Divider(),
          _securityTitle(),
          _requireMeetingIdButton(),
          _passwordInput(),
          _enableWaitingRoomRadioBtn(),
          _allowAuthenticatedUser(),
          Divider(),
          _meetingOptionTitle(),
          _hostVideoOnButton(),
          _participantVideoOnButton(),
          _allowAuthenticatedUserOnly(),
          _allowJoinBeforeHostUser(),
          _autoRecordMeeting(),
          _regionEntryBox(),
          Divider(),
          _addToCalenderButton(),
        ],
      ),
    );
  }
}
