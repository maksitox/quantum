import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    Navigator.pushNamed(context, '/main');
  }

  void _navigateToRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: isSmallScreen
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoWidget(size: 100),
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
                  )
                : Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LogoWidget(size: 150),
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
        ),
      ),
    );
  }
}
