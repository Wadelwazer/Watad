import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watad/cubit/Landing_Page_Bloc/landing_page_bloc.dart';
import 'package:watad/cubit/locale_cubit.dart';
import 'package:watad/presintation/screen/login.dart';

class RouteGenerator {
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  late LocaleCubit localeCubit;

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
            value: landingPageBloc,
            child: Login(),
          ),
        );

      case "/settings":
      case "/test":
      // return MaterialPageRoute(
      //   //  builder: (_) =>  TestPage(title: "landing",),
      //   //builder: (_) => BlocProvider<TestCubit>.value(
      //    // value: TestCubit(),
      //     //child: TestPage(title: "landing"),
      //   //),
      //   //builder: (_) =>   TestPage(title: 'bbb',),
      // );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
