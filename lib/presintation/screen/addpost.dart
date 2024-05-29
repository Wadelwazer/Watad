import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController textEditingController = TextEditingController();

  String _selectedservicetype = "سباكة";

  List<String> myarraycategory = ["سباكة", "نجارة", "مكانيكي", "حدادة"];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0.2, 0.9],
              colors: [grey, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Add Post",
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'ElMessiri')),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Form(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Type of Service",
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
                      ],
                    ),
                    buildTextField()
                  ],
                ),
              )),
            )
          ],
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
