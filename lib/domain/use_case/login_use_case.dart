import 'package:hackathon/domain/repo/abstract_auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AbstractAuthRepo repo;

  LoginUseCase({required this.repo});

  Future<String?> call(String email, String password) async => await repo.login(email, password);
}