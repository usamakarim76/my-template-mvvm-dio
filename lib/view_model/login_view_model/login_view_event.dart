part of 'login_view_bloc.dart';

abstract class LoginViewEvent extends Equatable {
  const LoginViewEvent();

  @override
  List<Object> get props => [];
}

class LoginPostApiEvent extends LoginViewEvent {
  final BuildContext context;
  final String email;
  final String password;
  const LoginPostApiEvent(this.context, this.email, this.password);
}
