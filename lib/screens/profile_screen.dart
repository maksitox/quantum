// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:quantum/screens/login_screen.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  final String username = 'John Doe';
  final String email = 'johndoe@example.com';
  final List<String> linkedWallets = [
    'BTC Wallet: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa',
    'ETH Wallet: 0x32Be343B94f860124dC4fEe278FDCBD38C102D88'
  ];

  ProfileScreen({Key? key}) : super(key: key);

  void _editProfile() {
    // Edit profile functionality
  }

  void _logOut(BuildContext context) {
    // Log out functionality
    // Navigator.pop(context);
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/avatar_placeholder.png'), // Replace with actual image
            ),
            const SizedBox(height: 16.0),
            Text(
              username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Linked Wallets:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            for (var wallet in linkedWallets)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  wallet,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 24.0),
            CustomButton(
              text: 'Edit Profile',
              onPressed: _editProfile,
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Log Out',
              onPressed: () => _logOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
