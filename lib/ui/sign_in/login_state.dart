part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class StartLoadingState extends LoginState {}

final class StopLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {}

final class UnexpectedErrorState extends LoginState {}

final class SuccessfulLoginState extends LoginState {
  final UserModel user;

  SuccessfulLoginState(this.user);
}
