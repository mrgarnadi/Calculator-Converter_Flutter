import 'package:flutter/material.dart';

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0;

  void _convert() {
    setState(() {
      double input = double.parse(_controller.text);
      _result = input / 1000; // Konversi dari Meter ke Kilometer sebagai contoh
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Panjang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan panjang dalam Meter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Konversi ke Kilometer'),
            ),
            SizedBox(height: 20),
            Text('Hasil: $_result Kilometer'),
          ],
        ),
      ),
    );
  }
}
