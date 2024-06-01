// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/BottomBar/addpost.dart';
import 'package:watad/presintation/screen/BottomBar/chat.dart';
import 'package:watad/presintation/screen/BottomBar/favorites.dart';
import 'package:watad/presintation/screen/BottomBar/profile_page.dart';
import 'package:watad/presintation/screen/Home%20and%20Postes/landingpage.dart';
import 'package:watad/services/app_localizations.dart';

class BottmnavgBar extends StatefulWidget {
  final int currentindex;
  BottmnavgBar({super.key, required this.currentindex});

  @override
  State<BottmnavgBar> createState() => _BottmnavgBar();
}

class _BottmnavgBar extends State<BottmnavgBar> {
  List<BottomNavigationBarItem> bottomNavItems(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'home'.tr(context),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined), //grid_3x3
        label: 'profile'.tr(context),
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_outline_outlined,
            color: darkpurple,
          ),
          backgroundColor: darkpurple,
          label: ""),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_outline,
          size: 30,
        ),
        label: 'favourite'.tr(context),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_outlined),
        label: "chat".tr(context),
      ),
    ];
    return bottomNavItems;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavItems(context), //bottomNavItems,
      currentIndex: widget.currentindex,
      selectedItemColor:
          Colors.blueGrey, //Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 17,
      selectedLabelStyle: TextStyle(fontFamily: 'ElMessiri'),
      unselectedLabelStyle: TextStyle(fontFamily: 'Gordita'),
      showUnselectedLabels: true,
      onTap: (i) {
        switch (i) {
          case 0:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ));
          case 1:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
          case 2:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPost(),
                ));
          case 3:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Favorites(),
                ));
          case 4:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Chatting(),
                ));
        }
      },
    );
  }
}
