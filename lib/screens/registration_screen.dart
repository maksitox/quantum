// lib/screens/registration_screen.dart

import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
// import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegistration() {
    // Handle registration logic here
    // For now, just print the values
    print('Username: ${_usernameController.text}');
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
  }

  void _navigateToLogin() {
    // Navigate back to Login screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const LogoWidget(),
              const SizedBox(height: 24.0),
              CustomTextField(
                label: 'Username',
                controller: _usernameController,
                isPassword: false,
                icon: Icons.account_circle,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
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
                text: 'Register',
                onPressed: _handleRegistration,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: _navigateToLogin,
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
