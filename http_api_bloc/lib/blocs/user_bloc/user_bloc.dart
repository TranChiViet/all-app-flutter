import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:http_api_bloc/blocs/bloc_export.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _usersRepository;
  UserBloc(this._usersRepository) : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
  }

  void _onLoadUser(LoadUser event, Emitter emit) async {
    emit(UserLoading());
    try {
      final users = await _usersRepository.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
      print(e.toString());
    }
  }
}
