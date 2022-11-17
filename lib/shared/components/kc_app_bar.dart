import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:klab_post_code_search/shared/theme/cubit/theme_cubit.dart';

class KCAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KCAppBar({super.key, required this.title});
  final String title;

  PreferredSizeWidget _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      toolbarHeight: 84,
      elevation: 0,
      actions: [
        _buildThemeModeIcon(),
      ],
      centerTitle: true,
      title: Text(
        title,
        style: theme.textTheme.headline4!.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildThemeModeIcon() {
    return Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              context.read<ThemeCubit>().updateTheme();
            },
            icon: context.read<ThemeCubit>().state == Brightness.light
                ? const Icon(
                    Icons.light_mode,
                  )
                : const Icon(Icons.dark_mode),
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return _buildAppBar(theme);
  }

  @override
  Size get preferredSize => const Size.fromHeight(84);
}
