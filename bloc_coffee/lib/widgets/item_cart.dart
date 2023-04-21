import 'package:bloc_coffee/config/config_export.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';
import '../screens/item_detail.dart';

class ItemCart extends StatelessWidget {
  ItemCart({super.key, required this.item});
  Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorApp.blckFourth,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemDetailScreen(
                          item: item,
                        )));
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item.image),
                    )),
              ),
            ),
            _buildName(),
          ],
        ),
        
        _buildQuantity(),
      ]),
    );
  }

  Container _buildQuantity() {
    return Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: ColorApp.cfMilk,
                  borderRadius: BorderRadius.circular(8)),
              child: const ImageIcon(
                AssetImage(AssetPath.iconDecrease),
              ),
            ),
            Expanded(
              child: Text(
                '10',
                style: TxtStyle().txt_20_white,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: ColorApp.cfMilk,
                  borderRadius: BorderRadius.circular(8)),
              child: const ImageIcon(
                AssetImage(AssetPath.iconIncrease),
              ),
            ),
          ],
        ));
  }

  Column _buildName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cappuccino', style: TxtStyle().txt_14_white),
            Text(item.name, style: TxtStyle().txt_14_white),
          ],
        ),
        Text('₹ ${item.price.toString()}', style: TxtStyle().txt_14_white),
      ],
    );
  }
}
