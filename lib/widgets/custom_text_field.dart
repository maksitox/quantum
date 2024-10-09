// lib/widgets/custom_text_field.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
        prefixIcon: isPassword
            ? const Icon(Icons.lock)
            : const Icon(Icons.account_balance_wallet),
      ),
    );
  }
}
