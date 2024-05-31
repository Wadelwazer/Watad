// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, must_be_immutable, avoid_unnecessary_containers, avoid_types_as_parameter_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
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
  List<String>? newDataList;
  TextEditingController searchText = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    newDataList = List.from(myarraycategory);
    super.initState();
  }

  onitemChange(String value) {
    setState(() {
      newDataList = myarraycategory
          .where((String) => String.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home".tr(context),
            style:
                const TextStyle(fontFamily: 'ElMessiri', color: Colors.white),
          ),
          backgroundColor: darkpurple,
          actions: [
            IconButton(
                onPressed: () {
                  scaffoldState.currentState!.openEndDrawer();
                },
                icon: const Icon(Icons.menu_outlined,
                    color: Colors.white, size: 30)),
          ],
          flexibleSpace: FlexibleSpaceBar(),
        ),
        key: scaffoldState,
        endDrawer: const MyDrawer(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.5, 1),
                        blurRadius: 3)
                  ],
                  border: Border.all(color: darkpurple),
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                onChanged: (value) {
                  //search code Here!
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: darkpurple,
                    ),
                    hintText: "Search...".tr(context),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15)),
              ),
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myarraycategory.length,
                      itemBuilder: (context, i) {
                        return buildpost(
                          pro_name: myarraycategory[i].toString(),
                        );
                      })),
            ),
          ],
        ),
        bottomNavigationBar: BottmnavgBar(
          currentindex: 0,
        ),
      ),
    );
  }
}

class buildpost extends StatelessWidget {
  String? pro_name;
  buildpost({super.key, required this.pro_name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ServicesType(servicetitle: pro_name!)),
          );
        },
        child: Card(
          child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pro_name!,
                    style: const TextStyle(
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                  //number of post
                  const Text("123"),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 30),
              leading: CircleAvatar(
                backgroundColor: darkpurple,
                child: SerivceIcon(
                    imagePath:
                        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                    onClicked: () {}),
              )
              //end of image
              ),
        ),
      ),
    );
  }
}
