// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:klab_post_code_search/features/result/presentation/pages/result_page.dart';

import '../../features/home/home.dart';

class RouteNames {
  static const HOME = '/';
  static const RESULT = '/result';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(
            builder: (_) => const HomePage(), settings: settings);
      case RouteNames.RESULT:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ResultPage(),
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
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
