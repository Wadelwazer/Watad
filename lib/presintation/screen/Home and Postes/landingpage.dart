// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, must_be_immutable, avoid_unnecessary_containers, avoid_types_as_parameter_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/BottomBar/favorites.dart';
import 'package:watad/presintation/screen/Home%20and%20Postes/servicetype.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/presintation/widget/circleimage.dart';
import 'package:watad/presintation/widget/drawer.dart';
import 'package:watad/services/app_localizations.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> myarraycategory = [
    "سباكة",
    "نجارة",
    "مكانيكي",
    "حدادة",
    "سباكة",
    "نجارة",
    "مكانيكي",
    "حدادة",
  ];

  TextEditingController searchText = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        child: Scaffold(
            key: scaffoldState,
            endDrawer: const MyDrawer(),
            body: Column(
              children: [
                Container(
                  width: width,
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: darkpurple,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            )),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      hintText: "Search...".tr(context),
                                      hintTextDirection: TextDirection.rtl,
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    onChanged: (val) {},
                                  ),
                                ),
                              ),
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
