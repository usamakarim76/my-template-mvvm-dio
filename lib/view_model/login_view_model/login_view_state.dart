part of 'login_view_bloc.dart';

abstract class LoginViewState extends Equatable {
  const LoginViewState();

  @override
  List<Object> get props => [];
}

class LoginViewInitialState extends LoginViewState {}

class LoginViewLoadingState extends LoginViewState {}

class LoginViewSuccessState extends LoginViewState {}

class LoginViewErrorState extends LoginViewState {
  final String message;
  const LoginViewErrorState(this.message);
}
