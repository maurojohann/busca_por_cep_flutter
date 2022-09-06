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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 26, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: theme.textTheme.headline4,
                ),
                Builder(
                  builder: (context) {
                    return Switch(
                      value:
                          context.read<ThemeCubit>().state == Brightness.light,
                      onChanged: (_) {
                        context.read<ThemeCubit>().updateTheme();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
