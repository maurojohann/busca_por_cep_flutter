import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klab_post_code_search/shared/router/route_generator.dart';


import '../../shared/theme/theme.dart';

class KLabApp extends StatelessWidget {
  const KLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, Brightness>(
        builder: (context, state) {
          var brightnees = state == Brightness.light
              ? ThemeSystem.themeDark
              : ThemeSystem.themeLight;

          return MaterialApp(
            title: 'Flutter Demo',
            theme: brightnees,
            initialRoute: RouteNames.HOME,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
