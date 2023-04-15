
import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import 'export.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 8, bottom: 8),
            width: size.width,
            child: const Text(
              "Ralph Break the Internet",
              style: TxtStyle.heading3Medium,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            child: Row(
              children: const [
                Star(),
                Star(),
                Star(),
                Star(),
                Star(),
                Text(
                  "(5.0)",
                  style: TxtStyle.heading4,
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 8, bottom: 8),
            width: size.width,
            child: const Text(
              "Action & adventure, Comedy",
              style: TxtStyle.heading4Light,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 8, bottom: 8),
            width: size.width,
            child: const Text(
              "1h41min",
              style: TxtStyle.heading4Light,
            ),
          ),
        ],
      ),
    );
  }
}
