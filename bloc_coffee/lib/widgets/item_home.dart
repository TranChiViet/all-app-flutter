import 'package:flutter/material.dart';

import '../config/config_export.dart';
import '../models/item.dart';

class ItemHome extends StatelessWidget {
  const ItemHome({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImage(),
            Text(
              item.name,
              style: const TextStyle(color: Colors.white),
            ),
            Container(
                height: size.height / 20,
                width: size.width / 4,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '₹ ${item.price.toString()}',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: size.height / 15,
                      width: size.height / 20,
                      decoration: BoxDecoration(
                          color: ColorApp.cfMilk,
                          borderRadius: BorderRadius.circular(16)),
                      child: const ImageIcon(
                        AssetImage(AssetPath.iconIncrease),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Stack _buildImage() {
    return Stack(
              // alignment: Alignment.topLeft,
              children: [
                Image.asset(item.image),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/iconStar.png'),
                      )),
                    ),
                    Positioned(
                      top: 2,
                      left: 10,
                      child: Container(
                        height: size.height / 50,
                        width: width / 10,
                        decoration: const BoxDecoration(
                            color: ColorApp.blckSecond,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(16),
                            )),
                        child: const Text(
                          '4.5',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ]);
  }
}
