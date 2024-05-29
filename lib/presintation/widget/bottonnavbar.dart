// ignore_for_file: prefer_const_constructors_in_immutables

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/addpost.dart';
import 'package:watad/presintation/screen/chat.dart';
import 'package:watad/presintation/screen/favorites.dart';
import 'package:watad/presintation/screen/landingpage.dart';
import 'package:watad/presintation/screen/profile_page.dart';
import 'package:watad/services/app_localizations.dart';

class BottmnavgBar extends StatefulWidget {
  final int currentindex;
  BottmnavgBar({super.key, required this.currentindex});

  @override
  State<BottmnavgBar> createState() => _BottmnavgBar();
}

class _BottmnavgBar extends State<BottmnavgBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Text(
              'home'.tr(context),
              style:
                  const TextStyle(fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
            Text(
              'profile'.tr(context),
              style:
                  const TextStyle(fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
            ),
            Text(
              'add'.tr(context),
              style:
                  const TextStyle(fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
            Text(
              'favourite'.tr(context),
              style:
                  const TextStyle(fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.chat_outlined,
              color: Colors.white,
            ),
            Text(
              'chat'.tr(context),
              style:
                  const TextStyle(fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ],
        )
      ],
      color: grey,
      backgroundColor: Colors.white,
      height: 60,
      index: widget.currentindex,
      animationDuration: const Duration(milliseconds: 300),
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
