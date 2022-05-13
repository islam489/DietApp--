part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
final LoginModel loginModelstate;
LoginLoaded({this.loginModelstate});
}

class LoginError extends LoginState {
  final LoginError loginModelstate;
  LoginError({this.loginModelstate});
}