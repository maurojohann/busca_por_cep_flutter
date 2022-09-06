import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klab_post_code_search/shared/components/kc_app_bar.dart';
import 'package:klab_post_code_search/shared/components/kc_header_base_page.dart';
import 'package:klab_post_code_search/shared/router/route_generator.dart';

import '../../shared/theme/theme.dart';
import 'bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KCAppBar(
        title: 'Busca CEP',
      ),
      body: KCHeaderBasePage(
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                      child: const Text('Buscar'),
                      onPressed: () {
                        context.read<ThemeCubit>().updateTheme();
                      }),
                ),
                Center(
                  child: ElevatedButton(
                      child: const Text('Navegar'),
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.RESULT);
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
