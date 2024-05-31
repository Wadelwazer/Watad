import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watad/business_logic/cubit/locale_cubit.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/constant/valid.dart';
import 'package:watad/main.dart';
import 'package:watad/presintation/screen/Home%20and%20Postes/landingpage.dart';
import 'package:watad/presintation/screen/Auth/signup.dart';
import 'package:watad/services/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> forms = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: color),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          //localization choises
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.public,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  BlocConsumer<LocaleCubit, ChangeLocaleState>(
                    listener: (context, state) {
                      setState(() {});
                    },
                    builder: (context, state) {
                      return DropdownButton<String>(
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: darkpurple,
                        focusColor: Colors.white,
                        value: state.locale.languageCode,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: ['ar', 'en'].map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(fontSize: 18),
                            ),
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
        ]),
        // backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            //top blue panel
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 4,
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                "assets/image/logo.png",
                width: 300,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),

            //login form
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                  key: forms,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Welcome Back".tr(context),
                        style: const TextStyle(
                            color: darkpurple,
                            fontSize: 26,
                            fontFamily: 'ElMessiri'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: phonenumber,
                                validator: (val) {
                                  return ValidInput(val!, 10, 15);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: darkpurple)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: darkpurple)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: darkpurple)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: darkpurple)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: darkpurple)),
                                    hintText: "Phone Number".tr(context),
                                    hintStyle: const TextStyle(
                                        fontFamily: 'ElMessiri',
                                        color: darkpurple),
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.phone_android_outlined,
                                      color: darkpurple,
                                    )),
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  color: darkpurple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: MaterialButton(
                                    child: Text(
                                      "Login".tr(context),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'ElMessiri'),
                                    ),
                                    onPressed: () {
                                      if (forms.currentState!.validate()) {
                                        sharedpref.setString(
                                            "phonenumber", phonenumber.text);
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const LandingPage(),
                                        ));
                                      }
                                    })),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't Have An Account?".tr(context),
                                  style: const TextStyle(
                                      fontSize: 14, fontFamily: 'ElMessiri'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: Text(
                                    "Create Account".tr(context),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: darkpurple,
                                        fontFamily: 'ElMessiri'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            //sign up
          ],
        ),
      ),
    );
  }
}
