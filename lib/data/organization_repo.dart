import 'package:firebase_database/firebase_database.dart';
import 'package:hackathon/domain/repo/abstract_organization_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AbstractOrganizationRepo)
class OrganizationRepo extends AbstractOrganizationRepo {
  final FirebaseDatabase db;
  late final DatabaseReference ref;

  OrganizationRepo(this.db) {
    ref = db.ref('organizations');
  }

  @override
  Future<String> addOrganization(String uid, String name) async {
    await ref.child(uid).set(name);
    return name;
  }
}
