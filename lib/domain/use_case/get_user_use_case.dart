import 'package:hackathon/domain/repo/abstract_user_repo.dart';

class GetUserUseCase {
  final AbstractUserRepo repo;

  GetUserUseCase(this.repo);

  Future call(String uid) => repo.getUser(uid);
}