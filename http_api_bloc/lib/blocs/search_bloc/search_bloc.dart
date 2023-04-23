import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/food.dart';
import '../../repos/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository repository;
  SearchBloc({required this.repository}) : super(SearchUninitialized()) {
    on<SearchEvent>(_onSearchEvent);
  }

  void _onSearchEvent(SearchEvent event, Emitter emit) async {
    if (event is Search) {
      emit(SearchLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final recipes = await repository.searchFoods(event.query);
        emit(SearchLoaded(recipes: recipes));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    }
  }
}
