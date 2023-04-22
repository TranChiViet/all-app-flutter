import 'package:bloc_coffee/config/config_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../bloc/item_bloc.dart';
import '../models/item.dart';
import '../screens/item_detail.dart';

class ItemCart extends StatelessWidget {
  ItemCart({super.key, required this.item});
  Item item;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: ScrollMotion(), children: [
        Expanded(
          child: GestureDetector(
            onTap: () => actionTap(ActionSlidable.favorite, context),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: ColorApp.cfMilk, borderRadius: BorderRadius.circular(16)),
              child: item.isFavorite == false
                    ? const Icon(
                        Icons.favorite_outline,
                        size: 30,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.red,
                      ),
            ),
          ),
        )
      ]),
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => actionTap(ActionSlidable.delete, context),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(16)),
                child: Icon(Icons.delete),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => actionTap(ActionSlidable.share, context),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 16, 0),
                    borderRadius: BorderRadius.circular(16)),
                child: Icon(Icons.share),
              ),
            ),
          ),
        )
      ]),
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(4),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorApp.blckFourth,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      ),
    );
  }

  void actionTap(ActionSlidable action, BuildContext context) {
    switch (action) {
      case ActionSlidable.delete:
        context.read<ItemBloc>().add(DeleteItem(item: item));
        break;
      case ActionSlidable.favorite:
      context.read<ItemBloc>().add(Favorite(item: item));
        break;
      case ActionSlidable.share:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${item.name} is share')),
        );
        break;
    }
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

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
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
      ),
    );
  }
}
