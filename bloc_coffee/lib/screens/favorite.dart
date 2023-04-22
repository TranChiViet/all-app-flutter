import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item_bloc.dart';
import '../models/item.dart';
import '../widgets/item_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
              List<Item> listItems= state.favoriteItems;
              return Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    Item item = listItems[index];
                    return ItemFavorite(
                      item: item,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    // childAspectRatio: 3 / 5,
                    // mainAxisExtent: 230,
                  ),
                ),
              ));
            },
          )
        ],
      )),
    );
  }
}
