// lib/routes.dart

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/main_wallet_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegistrationScreen(),
  '/profile': (context) => ProfileScreen(),
  '/main': (context) => MainWalletScreen(),
};
