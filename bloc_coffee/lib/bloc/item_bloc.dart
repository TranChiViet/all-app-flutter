import 'package:bloc/bloc.dart';
import 'package:bloc_coffee/models/item.dart';
import 'package:equatable/equatable.dart';

import '../config/config_export.dart';
import '../models/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState()) {
    on<AddItem>(_onAddItem);
    on<Favorite>(_onFavorite);
    on<DeleteItem>(_onDeleteItem);
    // on<MakeFavoriteOrUnFavoriteItem>(_onMakeFavoriteOrUnFavoriteItem);
  }
  void _onAddItem(AddItem event, Emitter<ItemState> emit) {
    final state = this.state;
    emit(ItemState(
      cartItems: List.from(state.cartItems)..add(event.item),
      favoriteItems: state.favoriteItems,
      homeItems: state.homeItems,
    ));
  }

  void _onFavorite(Favorite event, Emitter<ItemState> emit) {
    final state = this.state;
    List<Item> cartItems = state.cartItems;
    List<Item> favoriteItems = state.favoriteItems;

    if (event.item.isFavorite == false) {
      var itemIndex = cartItems.indexOf(event.item);
      cartItems = List.from(cartItems)
        ..remove(event.item)
        ..insert(itemIndex, event.item.copyWith(isFavorite: true));
      favoriteItems = List.from(favoriteItems)
        ..insert(0, event.item.copyWith(isFavorite: true));
    } else {
      var itemIndex = cartItems.indexOf(event.item);
      cartItems = List.from(cartItems)
        ..remove(event.item)
        ..insert(itemIndex, event.item.copyWith(isFavorite: false));
      favoriteItems = List.from(favoriteItems)..remove(event.item);
    }
    emit(ItemState(
      cartItems: cartItems,
      favoriteItems: favoriteItems,
      homeItems: state.homeItems,
    ));
  }

  void _onDeleteItem(DeleteItem event, Emitter<ItemState> emit) {
    final state = this.state;
    emit(ItemState(
      cartItems: List.from(state.cartItems)..remove(event.item),
      favoriteItems: state.favoriteItems,
      homeItems: state.homeItems,
    ));
  }
}
