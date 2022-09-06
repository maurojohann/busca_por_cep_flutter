import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klab_post_code_search/shared/components/kc_app_bar.dart';
import 'package:klab_post_code_search/shared/components/kc_header_base_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KCAppBar(title: 'Resultado'),
      body: KCHeaderBasePage(
        child: Container(),
      ),
    );
  }
}
