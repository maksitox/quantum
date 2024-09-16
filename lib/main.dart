import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crypto Wallet Test App'),
        ),
        body: CryptoInputField(),
      ),
    );
  }
}

class CryptoInputField extends StatefulWidget {
  const CryptoInputField({super.key});

  @override
  _CryptoInputFieldState createState() => _CryptoInputFieldState();
}

class _CryptoInputFieldState extends State<CryptoInputField> {
  String _cryptoName = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Enter Cryptocurrency Name:'),
          TextField(
            onChanged: (value) {
              setState(() {
                _cryptoName = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cryptocurrency',
            ),
          ),
          const SizedBox(height: 20),
          Text('You entered: $_cryptoName'),
        ],
      ),
    );
  }
}
