import 'package:go_router/go_router.dart';
import 'package:simple_blog_app/routes/auth_routes.dart';
import 'package:simple_blog_app/screens/home.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/sign-in',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      ...AuthRoutes.routes
    ],
  );
}
