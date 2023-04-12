import 'package:access_index/widgets/choose_equipment.dart';
import 'package:access_index/widgets/choose_page.dart';
import 'package:flutter/material.dart';

class ChooseStats extends StatefulWidget {
  const ChooseStats({Key? key}) : super(key: key);

  @override
  State<ChooseStats> createState() => _ChooseStatsState();
}

class _ChooseStatsState extends State<ChooseStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trang',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ChoosePage(),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thiết bị',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ChooseEquipment(),
            ],
          ),
        ),
      ],
    );
  }
}
