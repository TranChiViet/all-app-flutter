import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../constants/constants_export.dart';


class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 24, right: 24),
      child: SizedBox(
        height: size.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Find Your Best\nMovie',
              style: TxtStyle.heading1SemiBold,
            ),
            CircleAvatar(
              radius: size.height / 24,
              backgroundImage: const AssetImage(AssetPath.iconProfile),
            )
          ],
        ),
      ),
    );
  }
}
