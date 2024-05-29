import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/cubit/locale_cubit.dart';
import 'package:watad/presintation/screen/landingpage.dart';
import 'package:watad/presintation/screen/signup.dart';
import 'package:watad/presintation/widget/customeButtom.dart';
import 'package:watad/services/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: grey,
        elevation: 0,
        actions: [
          //localization choises
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const FaIcon(
                      FontAwesomeIcons.earthAsia,
                      color: gold,
                    ),
                  ),
                  BlocConsumer<LocaleCubit, ChangeLocaleState>(
                    listener: (context, state) {
                      setState(() {});
                    },
                    builder: (context, state) {
                      return DropdownButton<String>(
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: gold,
                        focusColor: Colors.white,
                        value: state.locale.languageCode,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: ['ar', 'en'].map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            BlocProvider.of<LocaleCubit>(context)
                                .changeLanguage(newValue);

                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                ],
              )),
          //localaization region end here
        ],
      ),
      // backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          //top blue panel
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 4,
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
//login form
          Container(
            margin: const EdgeInsets.only(top: 70),
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                Customebuttom(
                  text: "Login".tr(context),
                  onpress: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ));
                  },
                ),
              ],
            )),
          ),
          //sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have An Account?".tr(context),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Signup()));
                },
                child: Text(
                  "Create Account".tr(context),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: gold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
