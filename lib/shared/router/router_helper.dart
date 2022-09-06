import 'package:flutter/material.dart';

class RouterHelper {
  static Future<dynamic> route<T extends Widget>(
      BuildContext context, String routeName, T page) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => page,
      ),
    );
  }
}
