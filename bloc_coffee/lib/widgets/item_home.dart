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
          children: [
            Stack(children: [
                Image.asset(item.image),
                Row(
                  children: [
                    Container(
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/iconStar.png'),)
                      ),
                    ),
                    
                    Container(
                      decoration: BoxDecoration(
                  color: ColorApp.blckSecond.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  )),
                      child: const Text(
                        '4.5',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ]),
            
            Text(
              item.name,
              style: const TextStyle(color: Colors.white),
            ),
            Container(
                height: 50,
                width: 130,
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
                      height: 50,
                      width: 50,
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
}
