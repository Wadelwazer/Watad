// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:watad/services/app_localizations.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '4.8', 'Rate'.tr(context)),
          buildDivider(),
          buildButton(context, '35', 'Service Provider'.tr(context)),
          buildDivider(),
          buildButton(context, '50', 'Service Orders'.tr(context)),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        child: const VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'ElMessiri',
              ),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'ElMessiri',
              ),
            ),
          ],
        ),
      );
}
