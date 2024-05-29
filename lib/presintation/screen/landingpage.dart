// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, must_be_immutable, avoid_unnecessary_containers, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/login.dart';
import 'package:watad/presintation/screen/servicetype.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
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
        // backgroundColor: Colors.grey[100],

        appBar: AppBar(
          backgroundColor: grey,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: Colors.white,
                ))
          ],
        ),
        key: scaffoldState,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.5, 1),
                        blurRadius: 3)
                  ],
                  border: Border.all(color: gold),
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    newDataList = myarraycategory
                        .where((String) =>
                            String.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: newDataList!.length,
                              itemBuilder: (context, i) {
                                return buildpost(
                                  pro_name: newDataList![i].toString(),
                                );
                              })),
                    );
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: gold,
                  ),
                  hintText: "Search...".tr(context),
                ),
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
            leading: const CircleAvatar(
                backgroundColor: grey,
                child: Text(
                  "X",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                )),
            //end of image
          ),
        ),
      ),
    );
  }
}

Widget buildcateogrylist(String cat_name) => Container(
      padding: const EdgeInsets.only(right: 10, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200), color: grey),
          ),
          Text(
            cat_name,
            style: const TextStyle(fontSize: 20, fontFamily: 'Gordita'),
          )
        ],
      ),
    );
