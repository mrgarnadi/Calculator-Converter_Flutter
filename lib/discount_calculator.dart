import 'package:flutter/material.dart';

class DiscountCalculator extends StatefulWidget {
  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  final TextEditingController _originalPriceController = TextEditingController();
  final TextEditingController _discountPercentageController = TextEditingController();
  double _finalPrice = 0;

  void _calculateDiscount() {
    setState(() {
      double originalPrice = double.parse(_originalPriceController.text);
      double discountPercentage = double.parse(_discountPercentageController.text);
      double discountAmount = originalPrice * discountPercentage / 100;
      _finalPrice = originalPrice - discountAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Diskon'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _originalPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga Asli'),
            ),
            TextField(
              controller: _discountPercentageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Persentase Diskon'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateDiscount,
              child: Text('Hitung Diskon'),
            ),
            SizedBox(height: 20),
            Text('Harga Setelah Diskon: $_finalPrice'),
          ],
        ),
      ),
    );
  }
}
