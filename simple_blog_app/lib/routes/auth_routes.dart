import 'package:go_router/go_router.dart';
import 'package:simple_blog_app/screens/auth/sign_in.dart';
import 'package:simple_blog_app/screens/auth/sign_up.dart';

class AuthRoutes {
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static List<GoRoute> routes = [
    GoRoute(
      path: signIn,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) => SignUpScreen(),
    ),
  ];
}
