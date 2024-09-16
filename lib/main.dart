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
  String _cryptoIcon = '❓';

  void _updateCryptoIcon(String name) {
    setState(() {
      _cryptoName = name;
      switch (name.toLowerCase()) {
        case 'bitcoin':
          _cryptoIcon = '₿';
          break;
        case 'ethereum':
          _cryptoIcon = 'Ξ';
          break;
        case 'dogecoin':
          _cryptoIcon = 'Ð';
          break;
        default:
          _cryptoIcon = '❓';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Enter Cryptocurrency Name:'),
          TextField(
            onChanged: _updateCryptoIcon,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cryptocurrency',
            ),
          ),
          const SizedBox(height: 20),
          Text('$_cryptoIcon', style: const TextStyle(fontSize: 100)),
          Text('$_cryptoName', style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
