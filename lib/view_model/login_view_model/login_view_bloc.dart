import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_template/config/network_manager/repositories/auth_repository.dart';
import 'package:my_template/config/resources/app_strings.dart';
import 'package:my_template/services/storage/secure_storage_service.dart';
part 'login_view_event.dart';
part 'login_view_state.dart';

class LoginViewBloc extends Bloc<LoginViewEvent, LoginViewState> {
  AuthRepository? authRepository;
  LocalStorage storage = LocalStorage();
  LoginViewBloc({this.authRepository}) : super(LoginViewInitialState()) {
    on<LoginPostApiEvent>(
        (LoginPostApiEvent event, Emitter<LoginViewState> emit) async {
      try {
        emit(LoginViewLoadingState());
        Map<String, dynamic> loginData = {
          "email": event.email,
          "password": event.password,
        };
        final response = await authRepository?.login(loginData);
        await storage.setValue(AppStrings.accessToken, response?.token ?? "");
        emit(LoginViewSuccessState());
      } catch (e) {
        emit(LoginViewErrorState(e.toString()));
        debugPrint(e.toString());
      }
    });
  }
}
