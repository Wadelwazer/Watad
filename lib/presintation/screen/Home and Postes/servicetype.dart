// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/main.dart';
import 'package:watad/presintation/screen/Home%20and%20Postes/postview.dart';
import 'package:watad/presintation/widget/drawer.dart';
import 'package:watad/presintation/widget/tab_item.dart';
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
          "نتشرف بتقديم افضل الخدامات \n التي تsadkfjs;ljkdf;ljal;sjkdfj;laskjdf;ljkas;lkdfjl;askjd;lfjka;lsjd;fljkasdf\noiudaopsfojoasjdofoasiodiufojioasiodfuopiuasodhfoihaskdfwedf\nASSDUHYIPAsuhyfoihuiahfuihasoiudfuoasdipfhuouiSDOIFHUhdfDF\NAFIAHSIDFHOIHOIFHOIahsoidfjioAHOISFنساب جميع التخصصات المطلوبه في السوق\n من سباكة و حدادة و نجارة و حتى اعمال بنائ"
    },
    {
      "pro_id": "1",
      "pro_desc":
          " عامل سباكة متمرس في توصيلات المياه للمنازل و العمارات السكنية  تركييب مواسير و حنفيات و توصيل مياه للمنازل خدمة 24 ساعه يوجد أيضاً كهربائي لتوصيلات الكهرباء و اعمال البناء"
    },
    {
      "pro_id": "1",
      "pro_desc":
          "نتشرف بتقديم افضل الخدامات \n التي تنساب جميع التخصصات المطلوبه في السوق\n من سباكة و حدادة و نجارة و حتى اعمال بنائ"
    },
    {
      "pro_id": "1",
      "pro_desc":
          "نتشرف بتقديم افضل الخدامات \n التي تنساب جميع التخصصات المطلوبه في السوق\n من سباكة و حدادة و نجارة و حتى اعمال بنائ"
    },
    {
      "pro_id": "1",
      "pro_desc":
          " عامل سباكة متمرس في توصيلات المياه للمنازل و العمارات السكنية  تركييب مواسير و حنفيات و توصيل مياه للمنازل خدمة 24 ساعه يوجد أيضاً كهربائي لتوصيلات الكهرباء و اعمال البناء"
    },
    {
      "pro_id": "1",
      "pro_desc":
          "نتشرف بتقديم افضل الخدامات \n التي تنساب جميع التخصصات المطلوبه في السوق\n من سباكة و حدادة و نجارة و حتى اعمال بنائ"
    },
  ];
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldState,
        endDrawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: darkpurple,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.servicetitle,
            style:
                const TextStyle(color: Colors.white, fontFamily: 'ElMessiri'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  scaffoldState.currentState!.openEndDrawer();
                },
                icon: const Icon(Icons.menu_outlined,
                    color: Colors.white, size: 30)),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[600]),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                      color: darkpurple,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  labelColor: Colors.white,
                  labelStyle:
                      const TextStyle(fontSize: 16, fontFamily: 'ElMessiri'),
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
        body: TabBarView(children: [
          //Service Order Building !!
          Column(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myarraycategory.length,
                        itemBuilder: (context, i) {
                          return buildpost(
                              myarraycategory[i]['pro_desc'].toString(),
                              context);
                        })),
              ),
            ],
          ),
          //End of Service Order Building !!
          //Service Provide Building !!
          Column(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myarrayservicerovider.length,
                        itemBuilder: (context, i) {
                          return buildpost(
                              myarrayservicerovider[i]['pro_desc'].toString(),
                              context);
                        })),
              ),
            ],
          ),
          //End of Service Provide Building !!
        ]),
      ),
    );
  }
}

Widget buildpost(String post, BuildContext context) => Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: MaterialButton(
        padding: const EdgeInsets.all(5),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PostView(
              post: post,
              number: sharedpref.getString("phonenumber"),
            ),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  //facorite presse Here!
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            Text(
              post,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontFamily: 'ElMessiri', fontSize: 18, height: 2),
            ),
          ],
        ),
      ),
    );
