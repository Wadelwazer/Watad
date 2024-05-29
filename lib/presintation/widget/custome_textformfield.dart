// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';

class CustomeText extends StatelessWidget {
  final String? hinttext;
  final IconData? icon;
  final bool? star;
  TextEditingController? controller;
  CustomeText(
      {super.key,
      required this.icon,
      required this.hinttext,
      required this.controller,
      this.star});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: gold, width: 1)),
      child: TextFormField(
        controller: controller,
        obscureText: star!,
        decoration: InputDecoration(
            hintText: hinttext!,
            //  hintStyle: TextStyle(color: blue),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon!,
              color: gold,
            )),
      ),
    );
  }
}
