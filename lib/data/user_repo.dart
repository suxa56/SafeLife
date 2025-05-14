import 'package:firebase_database/firebase_database.dart';
import 'package:hackathon/di/injections.dart';
import 'package:hackathon/domain/model/user.dart';
import 'package:hackathon/domain/repo/abstract_user_repo.dart';
import 'package:hackathon/domain/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@Injectable(as: AbstractUserRepo)
class UserRepo extends AbstractUserRepo {
  final FirebaseDatabase db;
  late final DatabaseReference ref;

  UserRepo(this.db) {
    ref = db.ref('users');
  }

  @override
  Future<UserModel> getUser(String uid) async {
    var dataSnapshot = await ref.child(uid).get();
    if (dataSnapshot.exists) {
      final userMap = Map<String, dynamic>.from(dataSnapshot.value as Map);
      final user = UserModel.fromJson(userMap);
      return user;
    }
    getIt<Talker>().error("User repo -> getUser() -> User not found by given uid");
    throw Exception("User not found exception");
  }

  @override
  Future<bool> isAdmin(String uid) async {
    var user = await getUser(uid);
    return user.role.contains(Roles.superAdmin);
  }
}
