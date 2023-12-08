// ignore_for_file: prefer_const_constructors

import 'package:books_app/Presentation/bookpage.dart';
import 'package:books_app/Presentation/homepage.dart';
import 'package:books_app/Resources/strings_manager.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/Core/injection_control.dart' as di;

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String bookRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/store';
  static const String onBoardingRoute = '/onboarding';
  static const String settingsRoute = '/settings';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SafeArea(
              child: HomePage(),
            ),
          );
        }
      case Routes.bookRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SafeArea(
              child: BookPage(),
            ),
          );
        }

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: Text(AppStrings.noRouteFound),
      ),
    );
  }
}
