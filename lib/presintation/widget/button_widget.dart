// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_super_parameters

import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: grey,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ElMessiri',
          ),
        ),
        onPressed: onClicked,
      );
}
