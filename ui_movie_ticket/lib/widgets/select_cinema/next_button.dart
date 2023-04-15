
import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../constants/constants_export.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor: DarkTheme.grey),
          child: const ImageIcon(
            AssetImage(AssetPath.iconNext),
            color: DarkTheme.blueMain,
          ),
        ));
  }
}
