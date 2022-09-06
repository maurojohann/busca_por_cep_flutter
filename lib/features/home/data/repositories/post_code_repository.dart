import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:klab_post_code_search/features/home/data/entities/post_code_entity.dart';

import '../datasources/post_code_datasource.dart';

abstract class PostCodeRepository {
  Future<PostCodeEntity?> getPostCode(String postCode);
}

class PostCodeRepositoryImpl implements PostCodeRepository {
  final PostCodeDataSources postCodeDataSourcesDio;
  final PostCodeDataSources postCodeDataSourcesHive;

  PostCodeRepositoryImpl(
      this.postCodeDataSourcesDio, this.postCodeDataSourcesHive);

  @override
  Future<PostCodeEntity?> getPostCode(String postCodeString) async {
    PostCodeEntity? postCodeEntity;
    dynamic json;

    json = await postCodeDataSourcesHive.getPostCodeData(postCodeString);

    json ??= await postCodeDataSourcesDio.getPostCodeData(postCodeString);

    String encode = jsonEncode(json);
    var decode = jsonDecode(encode);
    if (json != null) {
      postCodeEntity = PostCodeEntity.fromJson(decode);
    }

    return postCodeEntity;
  }
}
