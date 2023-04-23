import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/food.dart';
import '../../repos/food_repo.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodRepository repository;
  FoodBloc({required this.repository}) : super(FoodInitialState()){
     on<FetchFoodEvent>(_onFetchFoodEvent);
  }

   void _onFetchFoodEvent(FetchFoodEvent event, Emitter emit) async {
    emit(FoodLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final recipes = await repository.getFoods();
      emit(FoodLoadedState(recipes: recipes));
    } catch (e) {
      emit(FoodErrorState(e.toString()));
    }
  }
  
}
