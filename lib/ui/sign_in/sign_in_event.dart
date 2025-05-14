part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {
  final GlobalKey<FormState> key;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInEvent({required this.key, required this.emailController, required this.passwordController});
}

