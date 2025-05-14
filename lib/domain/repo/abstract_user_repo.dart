import 'package:hackathon/domain/model/user.dart';

abstract class AbstractUserRepo {
  Future<UserModel> getUser(String uid);
  Future<bool> isAdmin(String uid);
}