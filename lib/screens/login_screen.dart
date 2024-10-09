// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'registration_screen.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    // Handle login logic here
    // For now, just print the values
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (context) => ProfileScreen()),
    );
  }

  void _navigateToRegister() {
    // Navigate to Registration screen
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (context) => const RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const LogoWidget(),
              const SizedBox(height: 24.0),
              CustomTextField(
                label: 'Email',
                controller: _emailController,
                isPassword: false,
                icon: Icons.email,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                isPassword: true,
                icon: Icons.lock,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Login',
                onPressed: _handleLogin,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: _navigateToRegister,
                child: const Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
