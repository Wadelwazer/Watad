// ignore_for_file: avoid_unnecessary_containers

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/screen/verficationotp.dart';
import 'package:watad/presintation/widget/customeButtom.dart';
import 'package:watad/presintation/widget/custome_textformfield.dart';
import 'package:watad/services/app_localizations.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();

  String _selectedcity = "الرياض";
  List<String> citylist = [
    "الرياض",
    "مكة المكرمة",
    "المدينة",
    "الهفوف",
    "الإحساء",
    "بقيق",
    "الدمام",
    "جيزان"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create New Account".tr(context),
            style:
                const TextStyle(color: Colors.white, fontFamily: 'ElMessiri')),
        backgroundColor: grey,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height / 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Image.asset(
                  "assets/image/logo.png",
                  width: 300,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              CustomeText(
                icon: Icons.person_3,
                hinttext: "Full Name".tr(context),
                controller: fullname,
                star: false,
              ),
              Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: gold, width: 1)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phonenumber,
                  decoration: InputDecoration(
                      hintText: "Phone Number".tr(context),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.phone_android_outlined,
                        color: gold,
                      )),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: gold, width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: citylist
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: 'ElMessiri'),
                              ),
                            ))
                        .toList(),
                    value: _selectedcity,
                    onChanged: (item) {
                      setState(() {
                        _selectedcity = item!;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 200,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 300,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                ),
              ),
              Customebuttom(
                text: "Signup".tr(context),
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VerficationOtp(
                      phonenumber: phonenumber.text,
                    ),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
