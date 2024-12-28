import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 22),
        ).margin(bottom: 33),
        Image.asset(
          ImageAssets.welcomeImages,
          width: 180,
          height: 180,
        )
      ],
    );
  }
}
