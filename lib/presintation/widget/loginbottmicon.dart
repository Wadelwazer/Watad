import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watad/constant/my_color.dart';

// ignore: must_be_immutable
class LoginBottomIcons extends StatelessWidget {
  final Icon? icon;
  void Function()? onpress;
  LoginBottomIcons({super.key, this.icon, this.onpress});
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: grey, borderRadius: BorderRadius.circular(400)),
        child: IconButton(
          onPressed: onpress,
          icon: icon!,
          color: Colors.white,
          iconSize: 30,
        ));
  }
}
