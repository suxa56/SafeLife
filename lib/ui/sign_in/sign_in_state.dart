part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SingInInitial extends SignInState {}

final class StartLoadingState extends SignInState {}

final class StopLoadingState extends SignInState {}

final class LoginErrorState extends SignInState {}
