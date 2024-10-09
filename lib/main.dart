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
          title: const Text('Crypto Wallet Test App'),
        ),
        body: const CryptoInputField(),
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
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Enter Cryptocurrency Name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            onChanged: _updateCryptoIcon,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Cryptocurrency',
              prefixIcon: const Icon(Icons.account_balance_wallet),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _cryptoIcon,
            style: const TextStyle(fontSize: 100, color: Colors.orangeAccent),
          ),
          Text(
            _cryptoName.isEmpty
                ? 'No cryptocurrency entered'
                : _cryptoName.toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(100, 100, 100, 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
