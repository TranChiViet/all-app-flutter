import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../model/movie.dart';
import '../common/export.dart';

class ChooseDate extends StatelessWidget {
  const ChooseDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map((day) => Builder(builder: (context) {
                  return Container(
                    height: size.height / 8,
                    width: size.width / 5,
                    decoration: BoxDecoration(
                        color: getColor(dateStates[days.indexOf(day)]),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            day,
                            style: TxtStyle.heading3Medium,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              (20 + days.indexOf(day)).toString(),
                              style: TxtStyle.heading3Medium,
                            ),
                          ),
                        ]),
                  );
                }))
            .toList(),
      ),
    );
  }
}
