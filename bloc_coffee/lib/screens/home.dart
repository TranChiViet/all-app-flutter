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
  List<String> topicItem= [
    'Flat White',
    'Espresso',
    'Americano',
    'Latte',
    'Cappuccino'
  ];

  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const SearchBar(),
          RotatedBox(
            quarterTurns: 3,
            child: CustomPaint(
              size: const Size(500, 100),
              painter: RPSCustomPainter(),
              child: Container(
                // height: 100,
                // margin: EdgeInsets.symmetric(vertical: 10),
                width: 450,
                child: Row(
                children: List.generate(5, (index){
                  return GestureDetector(
                     onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                    child: Padding(
                      padding: const EdgeInsets.all( 10.0),
                      child: Text(topicItem[index], style: selectedIndex == index
                                    ? TxtStyle().txt_16_cfMilk
                                    : TxtStyle().txt_14_cfMilk50,),
                    ),
                  );
                }).toList(),
                          ),
              ),
            ),
          ),
        ],
      ),
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
    path0.moveTo(0, h * 0.200);
    path0.lineTo(0, h);
    path0.lineTo(w - r, h);
    path0.quadraticBezierTo(w, h, w, h - r);
    path0.lineTo(w, h * 0.200);
    path0.lineTo(0, h * 0.200);

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
