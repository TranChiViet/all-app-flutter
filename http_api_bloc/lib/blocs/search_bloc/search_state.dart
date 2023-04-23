part of 'search_bloc.dart';

abstract class SearchState extends Equatable {}

class SearchUninitialized extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  List<Recipe> recipes;
  SearchLoaded({required this.recipes});
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  String message;
  SearchError(this.message);
  @override
  List<Object> get props => [message];
}
