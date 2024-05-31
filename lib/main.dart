// ignore_for_file: unnecessary_type_check, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watad/business_logic/cubit/locale_cubit.dart';
import 'package:watad/presintation/screen/Auth/splash.dart';
import 'package:watad/services/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
late SharedPreferences sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          if (state is ChangeLocaleState) {
            return MaterialApp(
                locale: state.locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
                home: const SplashScreen());
          }
          return const SizedBox();
        },
      ),
    );
  }
}
