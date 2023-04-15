
import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../constants/constants_export.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      height: size.height / 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: DarkTheme.white)),
      child: Row(children: const [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Select your country',
                hintStyle: TxtStyle.heading4,
                icon: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ImageIcon(
                    AssetImage(AssetPath.iconLocation),
                    color: DarkTheme.white,
                  ),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 36,
            color: DarkTheme.white,
          ),
        )
      ]),
    );
  }
}

