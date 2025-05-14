import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathon/di/injections.dart';
import 'package:hackathon/domain/use_case/get_user_use_case.dart';
import 'package:hackathon/domain/use_case/login_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

@lazySingleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final LoginUseCase loginUseCase;
  final GetUserUseCase getUserUseCase;

  SignInBloc(this.loginUseCase, this.getUserUseCase) : super(SingInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (!event.key.currentState!.validate()) return;

      emit(StartLoadingState());

      try {
        var uid = await loginUseCase(
          event.emailController.text.trim(),
          event.passwordController.text,
        );
        if (uid != null) {
          var msg = await getUserUseCase(uid);
          getIt<Talker>().debug(msg);
        }
      } catch (e) {
        emit(LoginErrorState());
      } finally {
        emit(StartLoadingState());
      }
    });
  }
}
