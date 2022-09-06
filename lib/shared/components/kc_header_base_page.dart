import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class KCHeaderBasePage extends StatelessWidget {
  const KCHeaderBasePage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        color: theme.colorScheme.secondary,
      ),
      child: child,
    );
  }
}
