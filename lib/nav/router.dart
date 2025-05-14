import 'package:go_router/go_router.dart';
import 'package:hackathon/ui/sign_in/login_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SignInScreen()),
]);