part of 'item_bloc.dart';

class ItemState extends Equatable {
  final List<Item> homeItems;
  final List<Item> cartItems;
  final List<Item> favoriteItems;
  const ItemState({
    this.homeItems = const <Item>[],
    this.cartItems = const <Item>[],
    this.favoriteItems = const <Item>[],
  });

  @override
  List<Object> get props => [
    homeItems,
        cartItems,
        favoriteItems,
      ];

  
}

