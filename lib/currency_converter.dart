import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0;

  void _convert() {
    setState(() {
      double input = double.parse(_controller.text);
      _result = input * 0.00007; // Konversi dari IDR ke USD sebagai contoh
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan jumlah dalam IDR'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Konversi ke USD'),
            ),
            SizedBox(height: 20),
            Text('Hasil: $_result USD'),
          ],
        ),
      ),
    );
  }
}
