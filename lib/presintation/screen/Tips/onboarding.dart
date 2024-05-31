// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/main.dart';
import 'package:watad/presintation/screen/Auth/login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    var onbaordinglist = [
      {
        "title": "Watad",
        "subtitle": "First Page Subtitle",
        "image": "assets/image/1.jpg"
      },
      {
        "title": "Watad",
        "subtitle": "Second Page Subtitle",
        "image": "assets/image/2.jpg"
      },
      {
        "title": "Watad",
        "subtitle": "Last Page Subtitle",
        "image": "assets/image/3.jpg"
      }
    ];
    final _controller = PageController();
    bool islast = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: IntroductionScreen(
            globalBackgroundColor: Colors.white,
            scrollPhysics: BouncingScrollPhysics(),
            pages: [
              PageViewModel(
                  titleWidget: Text(
                    onbaordinglist[0]['title'].toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'ElMessiri',
                        fontSize: 30),
                  ),
                  body: onbaordinglist[0]['subtitle'],
                  image: Image.asset(
                    onbaordinglist[0]['image'].toString(),
                    height: 400,
                    width: 400,
                  )),
              PageViewModel(
                  titleWidget: Text(
                    onbaordinglist[1]['title'].toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'ElMessiri',
                        fontSize: 30),
                  ),
                  body: onbaordinglist[1]['subtitle'],
                  image: Image.asset(
                    onbaordinglist[1]['image'].toString(),
                    height: 400,
                    width: 400,
                  )),
              PageViewModel(
                  titleWidget: Text(
                    onbaordinglist[2]['title'].toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'ElMessiri',
                        fontSize: 30),
                  ),
                  body: onbaordinglist[2]['subtitle'],
                  image: Image.asset(
                    onbaordinglist[2]['image'].toString(),
                    height: 400,
                    width: 400,
                  ))
            ],
            next: Icon(
              Icons.navigate_next_rounded,
              color: darkpurple,
            ),
            onDone: () {
              sharedpref.setString("tips", "1");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            onSkip: () {
              sharedpref.setString("tips", "1");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            showSkipButton: true,
            skip: Text("SKIP"),
            done: Text("FINISH"),
            dotsDecorator: DotsDecorator(
              size: Size.square(
                10,
              ),
              activeSize: Size(20, 10),
              color: Colors.grey,
              activeColor: darkpurple,
              spacing: EdgeInsets.symmetric(horizontal: 3),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            )),
      ),
    );
  }
}

Widget OnboardinContains(String? title, String? subtitle, String? image) =>
    Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            title!,
            style:
                const TextStyle(color: Colors.black, fontFamily: 'ElMessiri'),
          ),
          Image(image: AssetImage(image!)),
          Text(
            subtitle!,
            style:
                const TextStyle(color: Colors.black, fontFamily: 'ElMessiri'),
          ),
        ],
      ),
    );
