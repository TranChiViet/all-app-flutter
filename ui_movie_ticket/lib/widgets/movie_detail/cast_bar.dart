import 'package:flutter/material.dart';

import '../../model/movie.dart';
import 'caster_item.dart';


class CastBar extends StatelessWidget {
  const CastBar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: movies[0]
            .casters
            .map((e) => Builder(builder: (context) {
                  return CasterItem(
                    cast: e,
                  );
                }))
            .toList(),
      ),
    );
  }
}
