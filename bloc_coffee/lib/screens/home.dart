import 'package:bloc_coffee/models/item.dart';
import 'package:bloc_coffee/widgets/item_home.dart';
import 'package:flutter/material.dart';

import '../config/config_export.dart';
import '../widgets/header.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<String> topicItem = [
    'Flat White',
    'Espresso',
    'Americano',
    'Latte',
    'Cappuccino'
  ];

  late final TabController controller =
      TabController(length: topicItem.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: const [
                  Header(),
                  SearchBar(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: ColorApp.brown,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(35)),
                        ),
                        child: TabBar(
                            controller: controller,
                            indicatorColor: Colors.transparent,
                            labelColor: ColorApp.cfMilk,
                            labelPadding: EdgeInsets.zero,
                            unselectedLabelColor:
                                ColorApp.cfMilk.withOpacity(0.5),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            tabs: topicItem
                                .map((e) => Text(
                                      e,
                                      style: const TextStyle(fontSize: 14),
                                    ))
                                .toList()),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: TabBarView(controller: controller, children: [
                        const CappuccinoTab(),
                        Container(
                          child: const Center(child: Text('Espresso')),
                        ),
                        Container(
                          child: const Center(child: Text('Americano')),
                        ),
                        Container(
                          child: const Center(child: Text('Latte')),
                        ),
                        Container(
                          child: const Center(child: Text('Cappuccino')),
                        ),
                      ])),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CappuccinoTab extends StatelessWidget {
  const CappuccinoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          Item item = listItem[index];
          return ItemHome(
            item: item,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          // childAspectRatio: 3 / 5,
          mainAxisExtent: 230,
        ),
      ),
    );
  }
}
