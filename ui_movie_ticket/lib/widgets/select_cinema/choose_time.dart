
import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../model/movie.dart';
import '../common/export.dart';

class ChooseTime extends StatelessWidget {
  List<TicketStates> timeStates;
  ChooseTime({
    super.key,
    required this.timeStates
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 8, bottom: 16),
      height: size.height / 15,
      child: ListView.builder(
          itemCount: times.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 24),
              width: size.width/4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: getColor(timeStates[index]),
                borderRadius: BorderRadius.circular(14)
              ),
              child: Text(
                times[index],
                style: TxtStyle.heading3Medium,
              ),
            );
          })),
    );
  }
}

