// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';

class Customebuttom extends StatelessWidget {
  final String? text;
  void Function()? onpress;
  Customebuttom({super.key, this.text, this.onpress});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          child: Text(
            text!,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: onpress,
        ));
  }
}
