import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/data/models/user.dart';
import 'package:watad/data/utils/user_preferences.dart';
import 'package:watad/presintation/screen/landingpage.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/presintation/widget/button_widget.dart';
import 'package:watad/presintation/widget/numbers_widget.dart';
import 'package:watad/presintation/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems(context), //bottomNavItems,
          //currentIndex: state.tabIndex,
          selectedItemColor: gold, //Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 17,
          currentIndex: 1,
          backgroundColor: grey,
          selectedLabelStyle: const TextStyle(fontFamily: 'ElMessiri'),
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
                break;
              default:
            }
          }),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
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
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            "Mohamed", //user.name ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            "مبرمج تطبيقات", //user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'للمراسلة',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'حول',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
}
