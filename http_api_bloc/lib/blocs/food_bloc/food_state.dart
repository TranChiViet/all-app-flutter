part of 'food_bloc.dart';

abstract class FoodState extends Equatable {}

class FoodInitialState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadingState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadedState extends FoodState {
  List<Recipe> recipes;
  FoodLoadedState({required this.recipes});
  @override
  List<Object> get props => [recipes];
}

class FoodErrorState extends FoodState {
  String message;
  FoodErrorState(this.message);
  @override
  List<Object> get props => [message];
}
