part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}


class LoadUser extends UserEvent {
  
  @override
  List<Object> get props => [];
}