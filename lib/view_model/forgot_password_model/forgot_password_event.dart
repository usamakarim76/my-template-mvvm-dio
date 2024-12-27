part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordStepFirstEvent extends ForgotPasswordEvent {
  final String email;
  const ForgotPasswordStepFirstEvent(this.email);
}

class ForgotPasswordStepSecondEvent extends ForgotPasswordEvent {
  final String email;
  final String otp;
  const ForgotPasswordStepSecondEvent(this.email, this.otp);
}

class ForgotPasswordStepThirdEvent extends ForgotPasswordEvent {
  final String email;
  final String password;
  const ForgotPasswordStepThirdEvent(this.email, this.password);
}
