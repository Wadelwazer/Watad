// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/services/app_localizations.dart';

class VerficationOtp extends StatefulWidget {
  String phonenumber;
  VerficationOtp({super.key, required this.phonenumber});

  @override
  State<VerficationOtp> createState() => _VerficationOtpState();
}

class _VerficationOtpState extends State<VerficationOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Verification Code".tr(context),
                  style: const TextStyle(
                      fontFamily: 'ElMessiri',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 2),
                ),
                Text(
                  "we have sent verification code to".tr(context),
                  style: TextStyle(
                      fontFamily: 'ElMessiri',
                      fontSize: 18,
                      color: Colors.grey[700],
                      height: 2),
                ),
                Text(
                  widget.phonenumber,
                  style: const TextStyle(fontFamily: 'ElMessiri', fontSize: 22),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: grey)),
                  child: TextFormField(
                    onSaved: (pin1) {},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 30),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: grey)),
                  child: TextFormField(
                    onSaved: (pin2) {},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 30),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: grey)),
                  child: TextFormField(
                    onSaved: (pin3) {},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 30),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: grey)),
                  child: TextFormField(
                    onSaved: (pin4) {},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 30),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't get the code".tr(context),
                style: TextStyle(
                    fontFamily: 'ElMessiri',
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 2),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Resend".tr(context),
                  style: const TextStyle(
                    color: gold,
                    fontFamily: 'ElMessiri',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            decoration: BoxDecoration(
                color: gold, borderRadius: BorderRadius.circular(30)),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Confirm".tr(context),
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'ElMessiri'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
