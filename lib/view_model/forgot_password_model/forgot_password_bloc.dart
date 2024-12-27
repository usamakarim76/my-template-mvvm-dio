import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_template/config/models/response_msg_model/response_message_model.dart';
import 'package:my_template/config/network_manager/repositories/forgot_password_repository.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordRepository? forgotPasswordRepository;
  ForgotPasswordBloc({required this.forgotPasswordRepository})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordStepFirstEvent>(_forgotStepFirst);
    on<ForgotPasswordStepSecondEvent>(_forgotStepSecond);
    on<ForgotPasswordStepThirdEvent>(_forgotStepThird);
  }

  void _forgotStepFirst(ForgotPasswordStepFirstEvent event,
      Emitter<ForgotPasswordState> emit) async {
    try {
      emit(ForgotPasswordLoadingState());
      Map<String, dynamic> forgotData = {
        "email": event.email,
      };
      final response =
          await forgotPasswordRepository?.forgotPasswordStepFirst(forgotData);
      emit(ForgotPasswordSuccessState(response?.message ?? "Success"));
    } catch (e) {
      emit(ForgotPasswordStepErrorState(e.toString()));
    }
  }

  void _forgotStepSecond(ForgotPasswordStepSecondEvent event,
      Emitter<ForgotPasswordState> emit) async {
    try {
      emit(ForgotPasswordLoadingState());
      Map<String, dynamic> forgotData = {
        "email": event.email,
        "otp": event.otp,
      };
      ResponseMessageModel? response =
          await forgotPasswordRepository?.forgotPasswordStepFirst(forgotData);
      emit(ForgotPasswordSuccessState(response?.message ?? "Success"));
    } catch (e) {
      emit(ForgotPasswordStepErrorState(e.toString()));
    }
  }

  void _forgotStepThird(ForgotPasswordStepThirdEvent event,
      Emitter<ForgotPasswordState> emit) async {
    try {
      emit(ForgotPasswordLoadingState());
      Map<String, dynamic> forgotData = {
        "email": event.email,
        "password": event.password,
      };
      ResponseMessageModel? response =
          await forgotPasswordRepository?.forgotPasswordStepFirst(forgotData);
      emit(ForgotPasswordSuccessState(response?.message ?? "Success"));
    } catch (e) {
      emit(ForgotPasswordStepErrorState(e.toString()));
      debugPrint(e.toString());
    }
  }
}
