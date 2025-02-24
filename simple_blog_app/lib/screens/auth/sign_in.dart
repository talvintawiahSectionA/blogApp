import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/auth/vm.dart';
import 'package:simple_blog_app/routes/auth_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
        converter: (store) => LoginViewModel.fromStore(store),
        builder: (context, vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text("SIGN IN TO BLOG APP"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _emailField(vm),
                    SizedBox(height: 10),
                    _passwordField(vm),
                    SizedBox(height: 20),
                    vm.isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: vm.loginUser(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            ),
                            child: Text("Sign In"),
                          ),
                    TextButton(
                      onPressed: () => context.push(AuthRoutes.signUp),
                      child: Text("Don't have an account? Sign Up"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _passwordField(LoginViewModel vm) {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon:
              Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator: vm.validatePassword,
    );
  }

  Widget _emailField(LoginViewModel vm) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: vm.validateEmail,
    );
  }
}
