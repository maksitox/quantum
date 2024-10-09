// lib/main.dart

import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/logo_widget.dart';
import 'widgets/crypto_card.dart';

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
  String _cryptoSymbol = '';
  double _cryptoAmount = 0.0;
  String _cryptoIcon = '❓';
  final TextEditingController _controller = TextEditingController();

  void _updateCryptoIcon(String name) {
    setState(() {
      _cryptoName = name;
      switch (name.toLowerCase()) {
        case 'bitcoin':
          _cryptoIcon = '₿';
          _cryptoSymbol = 'BTC';
          _cryptoAmount = 1.5;
          break;
        case 'ethereum':
          _cryptoIcon = 'Ξ';
          _cryptoSymbol = 'ETH';
          _cryptoAmount = 10.0;
          break;
        case 'dogecoin':
          _cryptoIcon = 'Ð';
          _cryptoSymbol = 'DOGE';
          _cryptoAmount = 5000.0;
          break;
        default:
          _cryptoIcon = '❓';
          _cryptoSymbol = '';
          _cryptoAmount = 0.0;
      }
    });
  }

  void _handleClearPress() {
    setState(() {
      _cryptoName = '';
      _cryptoIcon = '❓';
      _cryptoSymbol = '';
      _cryptoAmount = 0.0;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const LogoWidget(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Enter Cryptocurrency Name:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextField(
              label: 'Cryptocurrency',
              controller: _controller,
              onChanged: _updateCryptoIcon,
            ),
            const SizedBox(height: 20),
            if (_cryptoSymbol.isNotEmpty)
              CryptoCard(
                name: _cryptoName,
                symbol: _cryptoSymbol,
                icon: _cryptoIcon,
                amount: _cryptoAmount,
              )
            else
              Text(
                'No cryptocurrency entered',
                style: const TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    color: Color.fromRGBO(100, 100, 100, 0.5)),
              ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Clear',
              onPressed: _handleClearPress,
            ),
          ],
        ),
      ),
    );
  }
}
