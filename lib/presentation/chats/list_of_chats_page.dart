import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/custome_widgets/chat_bar.dart';

class ListOfChatsPage extends StatefulWidget {
  const ListOfChatsPage({Key? key}) : super(key: key);

  @override
  _ListOfChatsPageState createState() => _ListOfChatsPageState();
}

class _ListOfChatsPageState extends State<ListOfChatsPage> {
  UIconstants uIconstants = UIconstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _listOfChatView());
  }

  Widget _listOfChatView() {
    return Column(
      children: [_headerBar(), _searchInput(), _allChatBlock()],
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
                "Chat",
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
            child: Icon(Icons.add),
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

  Widget _allChatBlock() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            ChatBar(
              name: 'Louis Tomlinson',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 2,
              isOnine: false,
              lastOnline: 6,
            ),
            ChatBar(
              name: 'Savannah Nguyen',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 2,
              isOnine: false,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Guy Hawkins',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 24,
              isOnine: true,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Dianne Russell',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 48,
              isOnine: false,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Louis Tomlinson',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 2,
              isOnine: false,
              lastOnline: 6,
            ),
            ChatBar(
              name: 'Savannah Nguyen',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 2,
              isOnine: false,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Guy Hawkins',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 24,
              isOnine: true,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Dianne Russell',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 48,
              isOnine: false,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Louis Tomlinson',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 2,
              isOnine: false,
              lastOnline: 6,
            ),
            ChatBar(
              name: 'Savannah Nguyen',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 2,
              isOnine: false,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Guy Hawkins',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 800,
              isOnine: true,
              lastOnline: 0,
            ),
            ChatBar(
              name: 'Dianne Russell',
              recentMessage: "It's all the things and other things",
              lastMessageTime: 48,
              isOnine: true,
              lastOnline: 0,
            ),
          ],
        )),
      ),
    );
  }
}
