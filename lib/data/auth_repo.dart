import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/domain/repo/abstract_auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AbstractAuthRepo)
class AuthRepo extends AbstractAuthRepo {
  final FirebaseAuth auth;

  AuthRepo({required this.auth});

  @override
  Future<String?> login(String email, String password) async {
    await auth.signOut();
    var userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user?.uid;

  }
}
