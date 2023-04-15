

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/config_export.dart';

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
    padding: EdgeInsets.only(right: 4),
    child: FaIcon(
      FontAwesomeIcons.solidStar,
      color: DarkTheme.yellow,
      size: 10,
    ),
  );
  }
}