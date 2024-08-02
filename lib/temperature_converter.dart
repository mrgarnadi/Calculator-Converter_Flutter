import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0;
  bool _isCelsius = true;

  void _convert() {
    setState(() {
      double input = double.parse(_controller.text);

      if (_isCelsius) {
        _result = (input * 9/5) + 32;
      } else {
        _result = (input - 32) * 5/9;
      }
    });
  }

  void _toggleConversion() {
    setState(() {
      _isCelsius = !_isCelsius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: _isCelsius ? 'Masukkan suhu dalam Celsius' : 'Masukkan suhu dalam Fahrenheit',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('Hasil: $_result ${_isCelsius ? 'Fahrenheit' : 'Celsius'}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleConversion,
              child: Text('Ubah ke ${_isCelsius ? 'Fahrenheit ke Celsius' : 'Celsius ke Fahrenheit'}'),
            ),
          ],
        ),
      ),
    );
  }
}
