import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/config/store.dart';
import 'package:simple_blog_app/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final store = createStore();

  runApp(BlogApp(store: store));
}

class BlogApp extends StatelessWidget {
  final Store<AppState> store;
  const BlogApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Blog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
