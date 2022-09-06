import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:klab_post_code_search/core/app/api_config.dart';
import 'package:klab_post_code_search/features/home/data/datasources/post_code_datasource.dart';
import 'package:klab_post_code_search/features/home/data/repositories/post_code_repository.dart';

import '../../features/home/data/datasources/post_code_datasources_remoto.dart';
import '../../features/home/data/datasources/post_code_datasources_local.dart';
import '../../features/home/home.dart';

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

    //DataSources
    getIt.registerSingleton<PostCodeDataSources>(
        PostCodeDataSourcesRemoto(getIt()),
        instanceName: 'dioDataSources');
    getIt.registerSingleton<PostCodeDataSources>(PostCodeDataSourcesLocal(),
        instanceName: 'hiveDataSources');

    // Repositories
    getIt.registerSingleton<PostCodeRepository>(PostCodeRepositoryImpl(
        getIt.get(instanceName: 'dioDataSources'),
        getIt.get(instanceName: 'hiveDataSources')));
    // Home Page BLoc
    getIt.registerFactory<HomePageBloc>(() => HomePageBloc(getIt()));
  }
}
