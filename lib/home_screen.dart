import 'package:flutter/material.dart';
import 'currency_converter.dart';
import 'discount_calculator.dart';
import 'temperature_converter.dart';
import 'circle_calculator.dart';
import 'length_converter.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final DateTime? date;
  final TimeOfDay? time;
  final bool isStudent;
  final List<String> selectedCalculators;

  HomeScreen({
    required this.name,
    required this.phone,
    required this.email,
    this.date,
    this.time,
    required this.isStudent,
    required this.selectedCalculators,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Diri Anda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            Text('Nama: $name'),
            Text('Nomor HP: $phone'),
            Text('Email: $email'),
            Text('Tanggal: ${date != null ? '${date!.day}/${date!.month}/${date!.year}' : 'Tidak dipilih'}'),
            Text('Waktu: ${time != null ? '${time!.hour}:${time!.minute}' : 'Tidak dipilih'}'),
            Text('Mahasiswa: ${isStudent ? 'Ya' : 'Tidak'}'),
            SizedBox(height: 16),
            Text(
              'Pilih Kalkulator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: selectedCalculators.map((calculator) {
                  return _buildMenuItem(
                    context,
                    icon: _getIcon(calculator),
                    title: calculator,
                    onTap: () => _navigateToCalculator(context, calculator),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String calculator) {
    switch (calculator) {
      case 'Konversi Mata Uang':
        return Icons.attach_money;
      case 'Perhitungan Diskon':
        return Icons.percent;
      case 'Konversi Suhu':
        return Icons.thermostat;
      case 'Hitung Lingkaran':
        return Icons.circle;
      case 'Konversi Panjang':
        return Icons.straighten;
      default:
        return Icons.help;
    }
  }

  void _navigateToCalculator(BuildContext context, String calculator) {
    switch (calculator) {
      case 'Konversi Mata Uang':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CurrencyConverter()),
        );
        break;
      case 'Perhitungan Diskon':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiscountCalculator()),
        );
        break;
      case 'Konversi Suhu':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TemperatureConverter()),
        );
        break;
      case 'Hitung Lingkaran':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CircleCalculator()),
        );
        break;
      case 'Konversi Panjang':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LengthConverter()),
        );
        break;
      default:
        break;
    }
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.deepPurple),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
