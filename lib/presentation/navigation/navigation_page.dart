import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neewzoom/presentation/contacts/contacts_page.dart';
import 'package:neewzoom/presentation/home/home_page.dart';
import 'package:neewzoom/presentation/meetings/meetings_page.dart';
import 'package:neewzoom/presentation/settings/settings_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> _pages = [
    HomePage(),
    ContactsPage(),
    MeetingsPage(),
    SettingsPage(),
  ];

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Househome.svg'),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/UserSquarecontacts.svg'),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Usersmeetings.svg'),
            label: "Meeting",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/GearSixsettings.svg'),
            label: "Settings",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
