import 'package:flutter/material.dart';

class CircleCalculator extends StatefulWidget {
  @override
  _CircleCalculatorState createState() => _CircleCalculatorState();
}

class _CircleCalculatorState extends State<CircleCalculator> {
  final TextEditingController _controller = TextEditingController();
  double _area = 0;
  double _circumference = 0;

  void _calculate() {
    setState(() {
      double radius = double.parse(_controller.text);
      _area = 3.14 * radius * radius;
      _circumference = 2 * 3.14 * radius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Keliling Lingkaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan jari-jari lingkaran'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text('Luas: $_area'),
            Text('Keliling: $_circumference'),
          ],
        ),
      ),
    );
  }
}
