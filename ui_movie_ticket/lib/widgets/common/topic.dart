

import 'package:flutter/material.dart';

import '../../config/config_export.dart';

class Topic extends StatelessWidget {
  Topic({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        title,
        style: TxtStyle.heading2,
      ),
    );
  }
}