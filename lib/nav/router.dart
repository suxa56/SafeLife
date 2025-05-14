import 'package:go_router/go_router.dart';
import 'package:hackathon/ui/register/register_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const RegisterScreen()),
]);