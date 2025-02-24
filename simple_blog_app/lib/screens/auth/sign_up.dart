import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/config/state.dart';
import 'package:simple_blog_app/data/auth/vm.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RegisterViewModel>(
        converter: (store) => RegisterViewModel.fromStore(store),
        builder: (context, vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text("SIGN UP TO BLOG APP"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _usernameField(vm),
                    SizedBox(height: 10),
                    _emailField(vm),
                    SizedBox(height: 10),
                    _passwordField(vm),
                    SizedBox(height: 20),
                    vm.isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => vm.registerUser(
                              _usernameController.text,
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            ),
                            child: Text("Sign Up"),
                          ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Already have an account? Sign In"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _passwordField(RegisterViewModel vm) {
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

  Widget _emailField(RegisterViewModel vm) {
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

  Widget _usernameField(RegisterViewModel vm) {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: "Username",
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      validator: vm.validateUsername,
    );
  }
}
