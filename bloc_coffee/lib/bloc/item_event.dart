part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}
class AddItem extends ItemEvent {
  final Item item;
  const AddItem({required this.item});

  @override
  List<Object> get props => [item];
}

class Favorite extends ItemEvent {
  final Item item;
  const Favorite({required this.item});

  @override
  List<Object> get props => [item];
}
class DeleteItem extends ItemEvent {
  final Item item;
  const DeleteItem({required this.item});

  @override
  List<Object> get props => [item];
}

class MakeFavoriteOrUnFavoriteItem extends ItemEvent {
  final Item item;
  const MakeFavoriteOrUnFavoriteItem({required this.item});

  @override
  List<Object> get props => [item];
}