import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon/di/injections.dart';
import 'package:hackathon/ui/sign_in/login_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final loginBloc = getIt<LoginBloc>();

  bool _loading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is StartLoadingState) {
          setState(() {
            _loading = true;
            _errorMessage = null;
          });
        }
        if (state is StopLoadingState) {
          setState(() {
            _loading = false;
          });
        }
        if (state is LoginErrorState) {
          setState(() {
            _errorMessage = "Неверный логин и/или пароль";
          });
        }
        if (state is UnexpectedErrorState) {
          setState(() {
            _errorMessage = "Что-то пошло не так";
          });
        }
        if (state is SuccessfulLoginState) {

        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Вход')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Введите email';
                    if (!value.contains('@')) return 'Некорректный email';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Пароль'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Введите пароль';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () =>  loginBloc.add(SignInEvent(key: _formKey, emailController: _emailController, passwordController: _passwordController)),
                  child: _loading
                      ? const CircularProgressIndicator()
                      : const Text('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}