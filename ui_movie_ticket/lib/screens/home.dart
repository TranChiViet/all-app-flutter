import 'package:flutter/material.dart';

import '../config/config_export.dart';
import '../widgets/home/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SearchBar(),
            const CategoryBar(),
            buildTitle("Now Playing"),
            const SliderBar(),
            buildTitle("Coming Soon"),
            const ComingSoon(),
            buildTitle("Promo"),
            const Promo(),
          ],
        ),
      ),
    );
  }

  Padding buildTitle(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: Text(
        content,
        style: TxtStyle.heading2,
      ),
    );
  }
}
