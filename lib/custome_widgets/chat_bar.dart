import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class ChatBar extends StatefulWidget {
  final String name;
  final String recentMessage;
  final int lastMessageTime;
  final bool isOnine;
  final int lastOnline;
  const ChatBar({
    Key? key,
    required this.name,
    required this.recentMessage,
    required this.lastMessageTime,
    required this.isOnine,
    required this.lastOnline,
  }) : super(key: key);

  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  UIconstants uIconstants = UIconstants();

  String getLastMessageInfo() {
    int hours = widget.lastMessageTime;
    if (hours >= 24) {
      int days = (hours / 24).floor();
      if (days > 1 && days < 28) {
        return "$days days ago";
      } else if (days == 1) {
        return "$days day ago";
      } else {
        int months = (days / 28).floor();
        if (months > 1) {
          return "$months months ago";
        } else {
          return "$months month ago";
        }
      }
    } else {
      if (hours > 1) {
        return "$hours hours ago";
      } else {
        return "$hours hour ago";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: uIconstants.defaultsmallPads,
            horizontal: uIconstants.defaultPads),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getAvatarWithStatus(
                          onLine: widget.isOnine,
                          lastOnline: widget.lastOnline),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: uIconstants.defaultPads - 10,
                              right: uIconstants.defaultsmallPads - 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4, top: 8),
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: uIconstants.defaultFontColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(widget.recentMessage,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 14,
                                        color: uIconstants.defaultFontColor)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(getLastMessageInfo(),
                  style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 14,
                      color: uIconstants.defaultFontColor)),
            )
          ],
        ));
  }

  Widget getAvatarWithStatus({required bool onLine, required int lastOnline}) {
    bool recentOnline = true;
    if (lastOnline < 1 || lastOnline > 59) {
      recentOnline = false;
    }

    return Container(
      width: 80,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('./assets/image/demo_profile.png'),
          ),
          onLine
              ? Align(
                  alignment: Alignment(0.6, 1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: uIconstants.defaultOnlineColor,
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                  ),
                )
              : recentOnline
                  ? Align(
                      alignment: Alignment(1, 1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Container(
                          decoration: BoxDecoration(
                              color: uIconstants.defaultOnlineColor,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            child: Text(
                              '$lastOnline mins',
                              style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
        ],
      ),
    );
  }
}
