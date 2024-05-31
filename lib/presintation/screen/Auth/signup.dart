// ignore_for_file: avoid_unnecessary_containers

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/constant/valid.dart';
import 'package:watad/presintation/screen/Auth/verficationotp.dart';
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
  GlobalKey<FormState> forms = GlobalKey();
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
    return Container(
      decoration: BoxDecoration(gradient: color),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          child: Form(
            key: forms,
            child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height / 5,
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Image.asset(
                    "assets/image/logo.png",
                    width: 300,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            textAlign: TextAlign.start,
                            "Create New Account".tr(context),
                            style: const TextStyle(
                                color: darkpurple,
                                fontSize: 26,
                                fontFamily: 'ElMessiri'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              CustomeText(
                                icon: Icons.person_3,
                                hinttext: "Full Name".tr(context),
                                controller: fullname,
                                star: false,
                                valid: (val) {
                                  return ValidInput(val!, 10, 15);
                                },
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: TextFormField(
                                  validator: (val) {
                                    return ValidInput(val!, 10, 15);
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: phonenumber,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: darkpurple)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: darkpurple)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: darkpurple)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: darkpurple)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: darkpurple)),
                                      hintText: "Phone Number".tr(context),
                                      hintStyle: TextStyle(color: darkpurple),
                                      border: InputBorder.none,
                                      prefixIcon: const Icon(
                                        Icons.phone_android_outlined,
                                        color: darkpurple,
                                      )),
                                ),
                              ),
                              Container(
                                //margin: const EdgeInsets.symmetric(vertical: 15),
                                width: 340,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: darkpurple, width: 1)),
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
                                                    fontSize: 16,
                                                    fontFamily: 'ElMessiri'),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
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
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            hintText: 'Search for an item...',
                                            hintStyle:
                                                const TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return item.value
                                            .toString()
                                            .contains(searchValue);
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
                              CustomeButtom(
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
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
