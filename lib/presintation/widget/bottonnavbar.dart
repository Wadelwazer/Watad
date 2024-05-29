import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/services/app_localizations.dart';

List<BottomNavigationBarItem> bottomNavItems(BuildContext context) {
  List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      backgroundColor: grey,
      icon: const Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      label: 'home'.tr(context),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.person_outlined,
        color: Colors.white,
      ), //grid_3x3
      label: 'profile'.tr(context),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: Colors.white,
      ),
      label: 'add'.tr(context),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.favorite_outline,
        color: Colors.white,
      ),
      label: 'favourite'.tr(context),
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.chat_outlined,
        color: Colors.white,
      ),
      label: "chat".tr(context),
    ),
  ];
  return bottomNavItems;
}
