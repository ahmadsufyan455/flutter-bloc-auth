import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/data/repository/app_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AppRepository _appRepository;
  RegisterBloc(this._appRepository) : super(RegisterInitial()) {
    on<LoadRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await _appRepository.register(event.requestData);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError(e.toString()));
      }
    });
  }
}
