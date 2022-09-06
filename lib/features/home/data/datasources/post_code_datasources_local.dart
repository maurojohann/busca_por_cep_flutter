import 'package:hive_flutter/hive_flutter.dart';

import 'post_code_datasource.dart';

class PostCodeDataSourcesLocal implements PostCodeDataSources {
  PostCodeDataSourcesLocal();

  @override
  Future<dynamic> getPostCodeData(postCode) async {
    var box = await Hive.openBox('post_code');
    var hasPostCode = box.containsKey(postCode);
    var result;
    if (hasPostCode) {
      result = await box.get(postCode);
    }

    box.close();
    print('PostCodeDataSourcesLocal.getPostCodeData: $result');
    return result;
  }
}
