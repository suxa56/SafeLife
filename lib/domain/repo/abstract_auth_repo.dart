abstract class AbstractAuthRepo {
  Future<String?> login(String email, String password);
}