import 'package:flutter/material.dart';

import 'card_main_stats.dart';

class ChartMainStats extends StatefulWidget {
  @override
  State<ChartMainStats> createState() => _ChartMainStatsState();
}

class _ChartMainStatsState extends State<ChartMainStats> {
  final titles = [
    'Tổng lượt xem',
    'Tỉ lệ chuyển đổi',
    'Tổng số người xem',
    'Tổng số khách hàng mua'
  ];

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return 
    Container(
      height: device.height * 0.35,
      width: device.width,
      padding: EdgeInsets.all(10),
      child: 
      GridView.builder(
        // padding: const EdgeInsets.all(10.0),
        itemCount: titles.length,
        itemBuilder: (ctx, i) => CardMainStats(
          titles[i],
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
