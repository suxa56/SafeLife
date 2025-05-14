import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathon/domain/model/user.dart';
import 'package:hackathon/domain/use_case/get_user_use_case.dart';
import 'package:hackathon/domain/use_case/login_use_case.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final GetUserUseCase getUserUseCase;

  LoginBloc(this.loginUseCase, this.getUserUseCase) : super(LoginInitial()) {
    on<SignInEvent>((event, emit) async {
      if (!event.key.currentState!.validate()) return;

      emit(StartLoadingState());

      try {
        // login by email and password, get uid
        var uid = await loginUseCase(
          event.emailController.text.trim(),
          event.passwordController.text,
        );
        if (uid != null) {
          // get user by uid
          var user = await getUserUseCase(uid);
          emit(SuccessfulLoginState(user));
        }
      } on FirebaseAuthException catch (_) {
        emit(LoginErrorState());
      } catch (e) {
        emit(UnexpectedErrorState());
      } finally {
        emit(StartLoadingState());
      }
    });
  }
}
