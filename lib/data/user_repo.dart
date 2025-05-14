import 'package:firebase_database/firebase_database.dart';
import 'package:hackathon/domain/repo/abstract_user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AbstractUserRepo)
class UserRepo extends AbstractUserRepo {
  final FirebaseDatabase db;
  late final DatabaseReference ref;

  UserRepo(this.db) {
    ref = db.ref('users');
  }

  @override
  Future getUser(String uid) async {
    var dataSnapshot = await ref.child(uid).get();
    print(uid);
    if (dataSnapshot.exists) {
      print(dataSnapshot.value);
      return dataSnapshot.value;
    }
  }
}
