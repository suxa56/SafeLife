import 'package:hackathon/domain/model/organization.dart';

abstract class AbstractOrganizationRepo {
  Future<String> addOrganization(Organization organization);
}
