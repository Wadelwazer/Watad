import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/widget/drawer.dart';
import 'package:watad/services/app_localizations.dart';

class PostView extends StatelessWidget {
  final String? post;
  final String? number;
  const PostView({super.key, this.post, this.number});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldState,
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: darkpurple,
        actions: [
          IconButton(
              onPressed: () {
                scaffoldState.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.menu_outlined,
                  color: Colors.white, size: 30)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Card(
              color: Colors.grey[200],
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    post!,
                    textAlign: TextAlign.justify,
                    maxLines: 20,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontFamily: 'ElMessiri', fontSize: 18, height: 2),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: darkpurple),
              child: MaterialButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse('tel://$number'))) {
                    await launchUrl(Uri.parse('tel:$number'));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add to Favorite".tr(context),
                      style: const TextStyle(
                          fontFamily: 'ElMessiri',
                          fontSize: 20,
                          height: 2,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: darkpurple),
              child: MaterialButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse('tel://$number'))) {
                    await launchUrl(Uri.parse('tel:$number'));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //user phone number from server here !!
                    Text(
                      number!,
                      style: const TextStyle(
                          fontFamily: 'ElMessiri',
                          fontSize: 20,
                          height: 2,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.phone,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 31, 85, 33)),
              child: MaterialButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse('tel://$number'))) {
                    await launchUrl(Uri.parse('tel:$number'));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "chat".tr(context),
                      style: const TextStyle(
                          fontFamily: 'ElMessiri',
                          fontSize: 20,
                          height: 2,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.phone,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
