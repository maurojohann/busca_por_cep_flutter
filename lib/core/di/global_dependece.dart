import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:klab_post_code_search/core/app/api_config.dart';

GetIt serviceLocator = GetIt.instance;

class GlobalDependencies {
  static final GlobalDependencies _singleton = GlobalDependencies._internal();

  factory GlobalDependencies() {
    return _singleton;
  }

  GlobalDependencies._internal();

  Future<void> setup() async {
    GetIt getIt = GetIt.I;
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);

    final Dio dio = Dio(BaseOptions(baseUrl: ApiConfig.baseURL));

    getIt.registerSingleton<Dio>(dio);
  }
}
