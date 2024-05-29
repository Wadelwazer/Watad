// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/addpost.dart';
import 'package:watad/presintation/screen/login.dart';
import 'package:watad/presintation/screen/profile_page.dart';
import 'package:watad/presintation/screen/servicestype.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/services/app_localizations.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var myarraycategory = [
    {
      "cat_id": "1",
      "cat_name": "سباكة",
    },
    {
      "cat_id": "3",
      "cat_name": "نجارة",
    },
    {
      "cat_id": "4",
      "cat_name": "مكانيكي",
    },
    {
      "cat_id": "5",
      "cat_name": "حدادة",
    },
    {
      "cat_id": "1",
      "cat_name": "سباكة",
    },
    {
      "cat_id": "3",
      "cat_name": "نجارة",
    },
    {
      "cat_id": "4",
      "cat_name": "مكانيكي",
    },
    {
      "cat_id": "5",
      "cat_name": "حدادة",
    },
  ];
  var myarrayproduct = [
    {
      "pro_id": "1",
      "pro_name": "ساندويتش بيرجر ",
      "pro_desc":
          "Welcome in our first watad version \n we happy to provide to you a special offers and services that \n can help you in yor house and let you know how to \n mainaines your things "
    },
    {
      "pro_id": "2",
      "pro_name": "مسحب دجاج",
      "pro_desc":
          "Descrition Descrition Descrition Descritionشرائح البيرقر مع قطع الخبز الطري و جبنة الشيدر الغنية بالفايتمينات المعززة لسلامتكم و سلامة اطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكم"
    },
    {
      "pro_id": "3",
      "pro_name": "أيسكريم",
      "pro_desc": "Descrition Descrition Descrition Descrition"
    },
    {
      "pro_id": "4",
      "pro_name": "عصائر",
      "pro_desc": "Descrition Descrition Descrition Descrition"
    },
    {
      "pro_id": "5",
      "pro_name": "ساندويتش بيرجر",
      "pro_desc": "Descrition Descrition Descrition Descrition"
    },
    {
      "pro_id": "1",
      "pro_name": "ساندويتش بيرجر ",
      "pro_desc":
          "Welcome in our first watad version \nwe happy to provide to you a special offers and services that \n can help you in yor house and let you know how to \n mainaines your things "
    },
    {
      "pro_id": "2",
      "pro_name": "مسحب دجاج",
      "pro_desc":
          "Descrition Descrition Descrition Descritionشرائح البيرقر مع قطع الخبز الطري و جبنة الشيدر الغنية بالفايتمينات المعززة لسلامتكم و سلامة اطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكماطفالكم"
    },
    {
      "pro_id": "3",
      "pro_name": "أيسكريم",
      "pro_desc": "Descrition Descrition Descrition Descrition"
    },
    {
      "pro_id": "4",
      "pro_name": "عصائر",
      "pro_desc": "Descrition Descrition Descrition Descrition"
    },
    {
      "pro_id": "5",
      "pro_name": "ساندويتش بيرجر",
      "pro_desc": "Descrition Descrition Descrition Descrition"
    },
  ];
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

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
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: grey,
            items: bottomNavItems(context), //bottomNavItems,
            //currentIndex: state.tabIndex,
            selectedItemColor: gold, //Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.white,
            selectedFontSize: 17,
            currentIndex: 0,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'ElMessiri',
            ),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Gordita'),
            showUnselectedLabels: true,
            onTap: (index) {
              // BlocProvider.of<LandingPageBloc>(context)
              //     .add(TabChange(tabIndex: index));
              switch (index) {
                case 0:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandingPage(),
                      ));
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPost(),
                      ));
                  break;
                default:
              }
            }),
        body: Column(
          children: [
            const buildsearchbar(),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myarraycategory.length,
                      itemBuilder: (context, i) {
                        return buildpost(
                          pro_name: myarraycategory[i]['cat_name'].toString(),
                        );
                      })),
            ),
          ],
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServicesType(servicetitle: pro_name!)));
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
            leading: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200), color: grey),
                child: Text(
                  "X",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                )),
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

class buildsearchbar extends StatefulWidget {
  const buildsearchbar({super.key});

  @override
  State<buildsearchbar> createState() => _buildsearchbarState();
}

class _buildsearchbarState extends State<buildsearchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0.5, 1), blurRadius: 3)
          ],
          border: Border.all(color: gold),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: gold,
          ),
          hintText: "Search...".tr(context),
        ),
      ),
    );
  }
}
