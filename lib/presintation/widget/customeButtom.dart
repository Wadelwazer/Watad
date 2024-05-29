// ignore_for_file: sort_child_properties_last, file_names

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';

class CustomeButtom extends StatelessWidget {
  final String? text;
  void Function()? onpress;
  CustomeButtom({super.key, this.text, this.onpress});
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
