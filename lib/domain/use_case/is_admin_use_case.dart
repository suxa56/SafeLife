import 'package:hackathon/domain/repo/abstract_user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class IsAdminUseCase {
  final AbstractUserRepo repo;

  IsAdminUseCase(this.repo);

  Future<bool> call(String uid) => repo.isAdmin(uid);
}