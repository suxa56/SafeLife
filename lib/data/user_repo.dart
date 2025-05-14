import 'package:firebase_database/firebase_database.dart';
import 'package:hackathon/di/injections.dart';
import 'package:hackathon/domain/model/user.dart';
import 'package:hackathon/domain/repo/abstract_user_repo.dart';
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
      return dataSnapshot.value as UserModel;
    }
    getIt<Talker>().error("User repo -> getUser() -> User not found by given uid");
    throw Exception("User not found exception");
  }
}
