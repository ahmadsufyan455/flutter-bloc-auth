import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/data/repository/app_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppRepository _appRepository;
  LoginBloc(this._appRepository) : super(LoginInitial()) {
    on<LoadLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final result = await _appRepository.login(event.requestData);
        await prefs.setString('token', result.loginResult!.token!);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}
