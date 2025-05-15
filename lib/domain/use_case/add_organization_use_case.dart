import 'package:hackathon/domain/model/organization.dart';
import 'package:hackathon/domain/repo/abstract_organization_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddOrganizationUseCase {
  final AbstractOrganizationRepo repo;

  AddOrganizationUseCase(this.repo);

  Future<String> call(Organization organization) => repo.addOrganization(organization);
}