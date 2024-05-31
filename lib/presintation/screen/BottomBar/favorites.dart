// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/main.dart';
import 'package:watad/presintation/screen/Home%20and%20Postes/postview.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/presintation/widget/drawer.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  var myarrayservicerovider = [
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
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldState,
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkpurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Favorite",
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
                    itemCount: myarrayservicerovider.length,
                    itemBuilder: (context, i) {
                      return buildpost(
                          myarrayservicerovider[i]['pro_desc'].toString(),
                          context);
                    })),
          ),
        ],
      ),
      bottomNavigationBar: BottmnavgBar(
        currentindex: 3,
      ),
    );
  }
}

Widget buildpost(String post, BuildContext context) => Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        child: Text(
          post,
          //textAlign: TextAlign.justify,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
          style:
              const TextStyle(fontFamily: 'ElMessiri', fontSize: 18, height: 2),
        ),
      ),
    );
