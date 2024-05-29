// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_final_fields

// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/presintation/widget/bottonnavbar.dart';
import 'package:watad/presintation/widget/customeButtom.dart';
import 'package:watad/services/app_localizations.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  String _selectedservicetype = "سباكة";
  String _posttype = "Service Order";
  List<String> myarraycategory = ["سباكة", "نجارة", "مكانيكي", "حدادة"];
  List<String> posttype = ["Service Order", "Service Provide"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0.6, 0.5],
              colors: [grey, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text("Add Post",
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'ElMessiri')),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: grey),
                  boxShadow: const [
                    BoxShadow(color: grey, blurRadius: 4, offset: Offset(2, 5))
                  ]),
              child: Form(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Type of Service".tr(context),
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'ElMessiri'),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: myarraycategory
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
                            value: _selectedservicetype,
                            onChanged: (item) {
                              setState(() {
                                _selectedservicetype = item!;
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
                              searchController: serviceController,
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
                                  controller: serviceController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText:
                                        'Search for an item...'.tr(context),
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                                serviceController.clear();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const Text("----------------------"),
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type of Post".tr(context),
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'ElMessiri'),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width / 2,
                            child: buildDropdown(
                              controller: postController,
                              list: posttype,
                              value: _posttype,
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTextField(),
                    CustomeButtom(
                      onpress: () {},
                      text: "Add".tr(context),
                    ),
                  ],
                ),
              )),
            )
          ],
        ),
        bottomNavigationBar: BottmnavgBar(
          currentindex: 2,
        ),
      ),
    );
  }
}

Widget buildTextField() => TextField(
    textInputAction: TextInputAction.newline,
    autofocus: true,
    maxLength: 1000,
    maxLines: 6,
    style: const TextStyle(
      fontSize: 16,
      fontFamily: 'ElMessiri',
    ),
    decoration: InputDecoration(border: border()));

InputBorder border() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: grey));

class buildDropdown extends StatefulWidget {
  String? value;
  TextEditingController? controller;
  List<String>? list;
  buildDropdown(
      {super.key,
      required this.value,
      required this.controller,
      required this.list});

  @override
  State<buildDropdown> createState() => _buildDropdownState();
}

class _buildDropdownState extends State<buildDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: widget.value!,
      items: widget.list!
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16, fontFamily: 'ElMessiri'),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          widget.value = value!;
        });
      },
    );
  }
}
