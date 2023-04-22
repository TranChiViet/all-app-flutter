import 'package:bloc_coffee/screens/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item_bloc.dart';
import '../config/config_export.dart';
import '../models/item.dart';

class ItemFavorite extends StatelessWidget {
  const ItemFavorite({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImage(context),
            Text(
              item.name,
              style: const TextStyle(color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                context.read<ItemBloc>().add(Favorite(item: item));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: ColorApp.cfMilk,
                    borderRadius: BorderRadius.circular(16)),
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
            )
          ],
        ),
      ),
    );
  }

  Stack _buildImage(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetailScreen(
                    item: item,
                  )));
        },
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(item.image),
              )),
        ),
      ),
      Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(
            color: ColorApp.blckSecond.withOpacity(0.7),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 15,
            ),
            Text(
              '4,5',
              style: TxtStyle().txt_14_white,
            ),
          ],
        ),
      ),
    ]);
  }
}
