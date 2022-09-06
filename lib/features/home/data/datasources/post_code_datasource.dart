import 'dart:convert';

import 'package:dio/dio.dart';

enum DatasourceError { badRequest, notFound }

abstract class PostCodeDataSources {
  Future<dynamic> getPostCodeData(String postCode);
}




