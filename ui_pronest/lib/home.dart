



import 'package:flutter/material.dart';

import 'switch_button.dart';
import 'topic_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  List<Topic> topicItem = [
    Topic('assets/icons/tempOff.png', 'Nhiệt độ'),
    Topic('assets/icons/humOff.png', 'Dộ ẩm'),
    Topic('assets/icons/propellerOff.png', 'Không khí'),
    Topic('assets/icons/leakOff.png', 'Bề mặt sàn'),
  ];
  late final TabController controller =
      TabController(length: topicItem.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 10,
            color: Colors.blue.withOpacity(0.35),
            // inset: true,
          ),
          BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 10,
            color: Colors.blue.withOpacity(0.25),
            // inset: true,
          ),
        ],
      ),
      child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: Colors.grey,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          tabs: topicItem
              .map((e) => Image.asset(e.icon))
              .toList()),
    ),
          Expanded(
                      child: Container(
                          child: TabBarView(controller: controller, children: [
                        Container(
                          child: const Center(child: Text('Espresso')),
                        ),
                        Container(
                          child: const Center(child: Text('Espresso')),
                        ),
                        Container(
                          child: const Center(child: Text('Americano')),
                        ),
                        Container(
                          child: const Center(child: Text('Latte')),
                        ),

                      ])),
                    ),
        ],
      ),
    );
  }
}