import 'package:hackathon/domain/model/user.dart';

abstract class AbstractUserRepo {
  Future getUser(String uid);
}