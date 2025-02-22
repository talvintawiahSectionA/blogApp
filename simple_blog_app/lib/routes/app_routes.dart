import 'package:go_router/go_router.dart';
import 'package:simple_blog_app/routes/auth_routes.dart';
import 'package:simple_blog_app/screens/home.dart';

class AppRoutes {
  static const String home = '/';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => HomePage(),
      ),
      ...AuthRoutes.routes
    ],
  );
}
