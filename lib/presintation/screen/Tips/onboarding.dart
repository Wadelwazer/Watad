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
        margin: const EdgeInsets.only(top: 50),
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
                bodyWidget: Text(
                  onbaordinglist[0]['subtitle'].toString(),
                  style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18),
                ),
                image: Image.asset(
                  onbaordinglist[0]['image'].toString(),
                  height: 400,
                  width: 400,
                ),
              ),
              PageViewModel(
                  titleWidget: Text(
                    onbaordinglist[1]['title'].toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'ElMessiri',
                        fontSize: 30),
                  ),
                  bodyWidget: Text(
                    onbaordinglist[1]['subtitle'].toString(),
                    style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18),
                  ),
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
                  bodyWidget: Text(
                    onbaordinglist[2]['subtitle'].toString(),
                    style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18),
                  ),
                  image: Image.asset(
                    onbaordinglist[2]['image'].toString(),
                    height: 400,
                    width: 400,
                  ))
            ],
            next: Icon(
              Icons.navigate_next_rounded,
              size: 30,
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
            skip: Text(
              "SKIP",
              style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18),
            ),
            done: Text(
              "FINISH",
              style: TextStyle(fontFamily: 'ElMessiri', fontSize: 18),
            ),
            dotsDecorator: DotsDecorator(
              size: Size.square(
                15,
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
