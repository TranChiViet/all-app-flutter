import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../model/cast.dart';


class CasterItem extends StatelessWidget {
  const CasterItem({
    Key? key,
    required this.cast,
  }) : super(key: key);

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 4),
        child: Container(
          width: size.width / 4.5,
          height: size.width / 4.5,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(cast.profileImageUrl))),
        ),
      ),
      Text(
        cast.name,
        style: TxtStyle.heading4Light,
      )
    ]);
  }
}
