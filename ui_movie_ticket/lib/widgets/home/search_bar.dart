import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/config_export.dart';
import '../../constants/constants_export.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SizedBox(
        height: size.height / 15,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: size.height / 15,
                decoration: BoxDecoration(
                  color: DarkTheme.darkBackground,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 12),
                      child: FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.search,
                        color: DarkTheme.white,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Movie',
                          hintStyle: TxtStyle.heading3Medium,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              width: size.height / 15,
              height: size.height / 15,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    GradientPalette.blue1,
                    GradientPalette.blue2,
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(AssetPath.iconControl),
            )
          ],
        ),
      ),
    );
  }
}
