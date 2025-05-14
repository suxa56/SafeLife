import 'package:hackathon/domain/model/user.dart';
import 'package:hackathon/domain/repo/abstract_user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUseCase {
  final AbstractUserRepo repo;

  GetUserUseCase(this.repo);

  Future<UserModel> call(String uid) => repo.getUser(uid);
}