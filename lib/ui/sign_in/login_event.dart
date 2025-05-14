part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class SignInEvent extends LoginEvent {
  final GlobalKey<FormState> key;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignInEvent({required this.key, required this.emailController, required this.passwordController});
}

