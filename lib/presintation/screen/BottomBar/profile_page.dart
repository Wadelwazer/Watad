// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, unnecessary_null_comparison
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/data/models/user.dart';
import 'package:watad/data/utils/user_preferences.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/presintation/widget/button_widget.dart';
import 'package:watad/presintation/widget/numbers_widget.dart';
import 'package:watad/presintation/widget/profile_widget.dart';
import 'package:watad/services/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isloading = false;
  File? _file;
  getimagefromGallery() async {
    isloading = true;
    setState(() {});
    final ImagePicker picker = ImagePicker();
    final XFile? imagegalary =
        await picker.pickImage(source: ImageSource.gallery);
    _file = File(imagegalary!.path);
    if (imagegalary != null) {
      //image upload api Here! image store in variable _file
    }
    isloading = false;
    setState(() {});
  }

  getimagefromCamera() async {
    isloading = true;
    setState(() {});
    final ImagePicker picker = ImagePicker();
    final XFile? imagegalary =
        await picker.pickImage(source: ImageSource.camera);
    _file = File(imagegalary!.path);
    if (imagegalary != null) {
      //image upload api Here!
    }
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(
                color: darkpurple,
              ),
            )
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 120,
                            child: Column(
                              children: [
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  onPressed: () {
                                    getimagefromGallery();
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.phone_android_outlined,
                                        color: darkpurple,
                                      ),
                                      Text(
                                        "Gallery".tr(context),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'ElMessiri'),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Colors.grey[400]),
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  onPressed: () {
                                    getimagefromCamera();
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: darkpurple,
                                      ),
                                      Text(
                                        "Camera".tr(context),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'ElMessiri'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                NumbersWidget(),
                const SizedBox(height: 48),
                buildAbout(user),
              ],
            ),
      bottomNavigationBar: BottmnavgBar(
        currentindex: 1,
      ),
    );
  }

  Widget buildName(User user) => const Column(
        children: [
          Text(
            "Mohamed", //user.name ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 4),
          Text(
            "مبرمج تطبيقات", //user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Chatting'.tr(context),
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About'.tr(context),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
}
