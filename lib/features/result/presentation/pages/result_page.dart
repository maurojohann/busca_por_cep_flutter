import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klab_post_code_search/features/home/data/entities/post_code_entity.dart';
import 'package:klab_post_code_search/shared/components/kc_app_bar.dart';
import 'package:klab_post_code_search/shared/components/kc_header_base_page.dart';

import '../../../home/home.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.postCodeEntity});

  final PostCodeEntity postCodeEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KCAppBar(title: 'Resultado'),
      body: KCHeaderBasePage(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              child: Table(
                children: [
                  TableRow(
                      children: [const Text('Cep'), Text(postCodeEntity.cep!)]),
                  TableRow(
                    children: [
                      const Text('logradouro'),
                      Text(postCodeEntity.logradouro!)
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('complemento'),
                      Text(postCodeEntity.complemento!)
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('bairro'),
                      Text(postCodeEntity.bairro!)
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('localidade'),
                      Text(postCodeEntity.localidade!)
                    ],
                  ),
                  TableRow(
                    children: [const Text('uf'), Text(postCodeEntity.uf!)],
                  ),
                  TableRow(
                    children: [const Text('ibge'), Text(postCodeEntity.ibge!)],
                  ),
                  TableRow(
                    children: [const Text('gia'), Text(postCodeEntity.gia!)],
                  ),
                  TableRow(
                    children: [const Text('ddd'), Text(postCodeEntity.ddd!)],
                  ),
                  TableRow(
                    children: [
                      const Text('siafi'),
                      Text(postCodeEntity.siafi!)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
