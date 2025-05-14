import 'package:hackathon/domain/repo/abstract_organization_repo.dart';

class AddOrganizationUseCase {
  final AbstractOrganizationRepo repo;

  AddOrganizationUseCase(this.repo);

  Future<String> call(String uid, String name) => repo.addOrganization(uid, name);
}