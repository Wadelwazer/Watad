// ignore_for_file: avoid_unnecessary_containers, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/services/app_localizations.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List phone = [];
  String? phonenumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        color: darkpurple,
        child: Drawer(
            backgroundColor: darkpurple,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("home".tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ElMessiri')),
                          leading: const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("profile".tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ElMessiri')),
                          leading: const Icon(
                            Icons.person_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("add".tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ElMessiri')),
                          leading: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("favourite".tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ElMessiri')),
                          leading: const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("chat".tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ElMessiri')),
                          leading: const Icon(
                            Icons.chat_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("Logout".tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ElMessiri')),
                          leading: const Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
