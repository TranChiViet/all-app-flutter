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

class _HomeScreenState extends State<HomeScreen> {
  List<String> topicItem = [
    'Flat White',
    'Espresso',
    'Americano',
    'Latte',
    'Cappuccino'
  ];

  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Header(),
        const SearchBar(),
        Expanded(
          child: Container(
            height: size.height / 2,
            // color: Colors.blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: CustomPaint(
                      size: Size(size.height * 0.53, 100),
                      painter: RPSCustomPainter(),
                      child: Container(
                        // height: 100,
                        // margin: EdgeInsets.symmetric(vertical: 10),
                        width: size.height * 0.5,
                        child: SingleChildScrollView(
                          child: Row(
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    topicItem[index],
                                    style: selectedIndex == index
                                        ? TxtStyle().txt_16_cfMilk
                                        : TxtStyle().txt_14_cfMilk50,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.builder(
                      itemCount: listItem.length,
                      itemBuilder: (context, index) {
                        Item item = listItem[index];
                        return ItemHome(item: item,);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 9/16,
                              mainAxisExtent: 230),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 40;
    Paint paint0 = Paint()
      ..color = ColorApp.brown
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.lineTo(0, h);
    path0.lineTo(w - r, h);
    path0.quadraticBezierTo(w, h, w, h - r);
    path0.lineTo(0, 0);

    path0.close();

    // canvas.drawShadow(path0.shift(const Offset(0, 5)),
    //     ColorApp.colorButtonBlue.withOpacity(0.3), 2.0, true);
    // canvas.drawShadow(path0.shift(const Offset(0, -3)),
    //     ColorApp.colorButtonBlue.withOpacity(0.3), 1.0, true);
    // canvas.drawShadow(path0.shift(const Offset(1, 0)),
    //     ColorApp.colorButtonBlue.withOpacity(0.3), 1.0, true);
    // canvas.drawShadow(path0.shift(const Offset(-1, 0)),
    //     ColorApp.colorButtonBlue.withOpacity(0.3), 1.0, true);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
