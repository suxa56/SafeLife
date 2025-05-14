import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/di/injections.dart';
import 'package:hackathon/domain/use_case/is_admin_use_case.dart';
import 'package:hackathon/ui/admin/admin_screen.dart';
import 'package:hackathon/ui/login/login_screen.dart';
import 'package:hackathon/ui/work_space/work_space.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/workspace', builder: (context, state) => const WorkSpace()),
    GoRoute(path: '/admin', builder: (context, state) => const AdminScreen()),
  ],
  redirect: (context, state) async {
    final user = getIt<FirebaseAuth>().currentUser;
    final isAdmin = getIt<IsAdminUseCase>();

    if (user == null) {
      return '/login';
    } else if (await isAdmin(user.uid)) {
      return '/admin';
    } else {
      return '/workspace';
    }
  },
);
