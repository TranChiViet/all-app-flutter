import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../constants/constants_export.dart';


class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height / 3.5,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(AssetPath.teaserRalph)),
              gradient: LinearGradient(colors: [
                GradientPalette.black1,
                GradientPalette.black2,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            GradientPalette.black2,
            GradientPalette.black1,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        )
      ],
    );
  }
}
