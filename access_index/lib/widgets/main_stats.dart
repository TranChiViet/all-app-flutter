import 'package:access_index/widgets/parameter_main_stats.dart';
import 'package:flutter/material.dart';

import 'chart_main_stats.dart';
import 'topic_main_stats.dart';

class MainStats extends StatelessWidget {
  const MainStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        children: [
          TopicMainStats(),
          // Divider(),
          // ParameterMainStats(),
          // ChartMainStats(),
        ],
      ),
    );
  }
}
