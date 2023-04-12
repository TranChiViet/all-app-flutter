// ignore_for_file: unnecessary_const

import 'package:access_index/widgets/choose_stats.dart';
import 'package:access_index/widgets/chart_main_stats.dart';
import 'package:flutter/material.dart';

import 'parameter_main_stats.dart';

class TopicMainStats extends StatefulWidget {
  TopicMainStats({Key? key}) : super(key: key);

  @override
  State<TopicMainStats> createState() => _TopicMainStatsState();
}

class _TopicMainStatsState extends State<TopicMainStats> {
  int currentIndex = 1;
  final screens = [
    ChartMainStats(),
    ParameterMainStats(),
    
  ];

  

  Widget buildTopic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          'Chỉ số chính',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        ChooseStats(),
      ],
    );
  }

  Widget buildButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('Hôm nay: 05/01/2023 - 05/01/2023'),
            const Text('(So sánh với: 04/01/2023 - 04/01/2023)'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                 setState(() {
                   currentIndex = 0;
                 });
                },
                icon: const Icon(Icons.keyboard_arrow_left)),
            (currentIndex == 0) ? Text('Xem biểu đồ') : Text('Xem thông số'),
            IconButton(
                onPressed: () {
                  setState(() {
                   currentIndex = 1;
                 });
                },
                icon: const Icon(Icons.keyboard_arrow_right)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTopic(),
          buildButton(),
          Divider(),
          screens[currentIndex],
        ],
      ),
    );
  }
}
