import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'post_code_datasource.dart';

class PostCodeDataSourcesRemoto implements PostCodeDataSources {
  final Dio dio;

  PostCodeDataSourcesRemoto(this.dio);
  @override
  Future getPostCodeData(postCode) async {
    try {
      var result = await dio.get("/ws/$postCode/json/");
      print('Result Json: $result ');

      if ((result.data as Map).containsKey('erro')) {
        throw DatasourceError.notFound;
      }
      await Hive.openBox('post_code')..put(postCode, result.data)..close();

      return result.data;
    } on DioError catch (e) {
      print(e.toString());
      throw DatasourceError.badRequest;
    }
  }
}
