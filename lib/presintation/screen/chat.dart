// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
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
    "phonenumber_": "0543885096",
    "user_image": "X"
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber_": "0543885096",
    "user_image": "X"
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber_": "0543885096",
    "user_image": "X"
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber_": "0543885096",
    "user_image": "X"
  },
  {
    "user_id": "1",
    "user_name": "Mohamed",
    "phonenumber_": "0543885096",
    "user_image": "X"
  }
];

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: grey,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text("chat".tr(context),
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'ElMessiri'))),
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
                  backgroundColor: grey,

                  //replace text with category image here from network
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                )),
            //end of image
          ),
        ));
