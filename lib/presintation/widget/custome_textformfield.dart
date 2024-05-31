// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';

class CustomeText extends StatelessWidget {
  final String? hinttext;
  final IconData? icon;
  final bool? star;
  TextEditingController? controller;
  String? Function(String?) valid;
  CustomeText(
      {super.key,
      required this.icon,
      required this.hinttext,
      required this.controller,
      this.star,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextFormField(
        validator: valid,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkpurple)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkpurple)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkpurple)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkpurple)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkpurple)),
          hintText: hinttext!,
          hintStyle: TextStyle(color: darkpurple),
          border: InputBorder.none,
          prefixIcon: Icon(
            icon!,
            color: darkpurple,
          ),
        ),
      ),
    );
  }
}
