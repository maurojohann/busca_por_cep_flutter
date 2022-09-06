import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/home.dart';
import '../main.dart';
import '../shared/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

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
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
