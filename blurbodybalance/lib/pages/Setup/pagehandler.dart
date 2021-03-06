import 'package:blurbodybalance/pages/profile.dart';
import 'package:blurbodybalance/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:blurbodybalance/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:blurbodybalance/pages/social.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  static String tag = 'PageHandler';
  @override
  _PageHandlerState createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
// Holds the index for which tab we are in
  int currentTab = 0;

  // Instantiate these pages to navigate between pages
  Home home;
  Profile profile;
  Settings settings;
  Social social;
  List<Widget> pages;

  Widget curPage;

  @override
  void initState() {
    home = Home();
    profile = Profile();
    settings = Settings();
    social = Social();

    pages = [home, profile, social, settings];
    curPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: curPage,
      // Needed to create a new theme for nav bar since there is no variable to change it's color

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTab,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              curPage = pages[index];
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              title: Text(
                'Profile',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              title: Text(
                'Friends',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              title: Text(
                'Settings',
              ),
            ),
          ]),
    );
  }
}
