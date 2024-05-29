// ignore_for_file: must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/landingpage.dart';
import 'package:watad/presintation/screen/profile_page.dart';
import 'package:watad/presintation/widget/tab_item.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/services/app_localizations.dart';

class ServicesType extends StatefulWidget {
  String servicetitle;
  ServicesType({super.key, required this.servicetitle});

  @override
  State<ServicesType> createState() => _ServicesTypeState();
}

class _ServicesTypeState extends State<ServicesType> {
  var myarraycategory = [
    {
      "pro_id": "1",
      "pro_desc":
          "نتشرف بتقديم افضل الخدامات \n التي تنساب جميع التخصصات المطلوبه في السوق\n من سباكة و حدادة و نجارة و حتى اعمال بنائ"
    },
  ];
  var myarrayservicerovider = [
    {
      "pro_id": "1",
      "pro_desc":
          " عامل سباكة متمرس في توصيلات المياه للمنازل و العمارات السكنية  تركييب مواسير و حنفيات و توصيل مياه للمنازل خدمة 24 ساعه يوجد أيضاً كهربائي لتوصيلات الكهرباء و اعمال البناء"
    },
  ];
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // backgroundColor: Colors.grey[100],

          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              widget.servicetitle,
              style:
                  const TextStyle(color: Colors.black, fontFamily: 'ElMessiri'),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: grey),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                        color: gold, borderRadius: BorderRadius.circular(10)),
                    labelColor: Colors.white,
                    labelStyle:
                        TextStyle(fontSize: 16, fontFamily: 'ElMessiri'),
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      TabItem(title: "Service Orders".tr(context), count: 122),
                      TabItem(title: "Service Provider".tr(context), count: 8)
                    ],
                  ),
                ),
              ),
            ),
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
                // BlocProvider.of<ServicesTypeBloc>(context)
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
                    break;
                  default:
                }
              }),
          body: TabBarView(children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myarraycategory.length,
                      itemBuilder: (context, i) {
                        return buildpost(
                          myarraycategory[i]['pro_desc'].toString(),
                        );
                      })),
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myarraycategory.length,
                      itemBuilder: (context, i) {
                        return buildpost(
                          myarrayservicerovider[i]['pro_desc'].toString(),
                        );
                      })),
            ),
          ])),
    );
  }
}

Widget buildpost(String post) => Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: MaterialButton(
        padding: const EdgeInsets.all(5),
        onPressed: () {},
        child: Text(
          post,
          //textAlign: TextAlign.justify,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18, height: 2),
        ),
      ),
    );
