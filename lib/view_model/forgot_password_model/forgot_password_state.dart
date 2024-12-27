part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String successMessage;
  const ForgotPasswordSuccessState(this.successMessage);
}

class ForgotPasswordStepErrorState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordStepErrorState(this.message);
}
