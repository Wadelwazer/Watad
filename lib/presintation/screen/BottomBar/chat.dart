// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/presintation/widget/circleimage.dart';
import 'package:watad/presintation/widget/drawer.dart';
import 'package:watad/services/app_localizations.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

var chatmap = [
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber": "0543885096",
    "user_image": "X"
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber": "0543885096",
    "user_image":
        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber": "0543885096",
    "user_image":
        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber": "0543885096",
    "user_image":
        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber": "0543885096",
    "user_image":
        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
  }
];

class _ChattingState extends State<Chatting> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      key: scaffoldState,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkpurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("chat".tr(context),
            style:
                const TextStyle(color: Colors.white, fontFamily: 'ElMessiri')),
        actions: [
          IconButton(
              onPressed: () {
                scaffoldState.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.menu_outlined,
                  color: Colors.white, size: 30)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chatmap.length,
                    itemBuilder: (context, i) {
                      return buildpost(
                          chatmap[i]['user_name'].toString(),
                          chatmap[i]['phonenumber'].toString(),
                          chatmap[i]['user_id'].toString(),
                          chatmap[i]['user_image'].toString());
                    })),
          ),
        ],
      ),
      bottomNavigationBar: BottmnavgBar(
        currentindex: 4,
      ),
    );
  }
}

Widget buildpost(String user_name, String user_number, String message,
        String user_image) =>
    Padding(
        padding: const EdgeInsets.all(2),
        child: InkWell(
          onTap: () {},
          child: Card(
            child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user_name,
                      style: const TextStyle(
                        fontFamily: 'ElMessiri',
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  user_number,
                  style: const TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
                leading: const CircleAvatar(
                    backgroundColor: darkpurple,

                    //replace text with category image here from network
                    child: SerivceIcon(
                      imagePath:
                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                      onClicked: null,
                    ))),
            //end of image
          ),
        ));
