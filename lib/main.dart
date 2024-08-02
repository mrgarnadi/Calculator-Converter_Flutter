import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isStudent = false;
  List<String> _selectedCalculators = [];

  final List<String> _calculators = [
    'Konversi Mata Uang',
    'Perhitungan Diskon',
    'Konversi Suhu',
    'Hitung Lingkaran',
    'Konversi Panjang',
  ];

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tanggal dipilih: ${date.day}/${date.month}/${date.year}')),
      );
    }
  }

  void _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Waktu dipilih: ${time.hour}:${time.minute}')),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            name: _nameController.text,
            phone: _phoneController.text,
            email: _emailController.text,
            date: _selectedDate,
            time: _selectedTime,
            isStudent: _isStudent,
            selectedCalculators: _selectedCalculators,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Isi Data Diri Anda',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Nomor HP',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor HP tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Text(
                      'Pilih Tanggal:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _pickDate,
                      child: Text(_selectedDate == null
                          ? 'Pilih Tanggal'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Text(
                      'Pilih Waktu:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _pickTime,
                      child: Text(_selectedTime == null
                          ? 'Pilih Waktu'
                          : '${_selectedTime!.hour}:${_selectedTime!.minute}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Apakah Anda Mahasiswa?',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: <Widget>[
                    Radio<bool>(
                      value: true,
                      groupValue: _isStudent,
                      onChanged: (value) {
                        setState(() {
                          _isStudent = value!;
                        });
                      },
                    ),
                    Text('Ya'),
                    Radio<bool>(
                      value: false,
                      groupValue: _isStudent,
                      onChanged: (value) {
                        setState(() {
                          _isStudent = value!;
                        });
                      },
                    ),
                    Text('Tidak'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Pilih Jenis Kalkulator',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                Column(
                  children: _calculators.map((calculator) {
                    return CheckboxListTile(
                      title: Text(calculator),
                      value: _selectedCalculators.contains(calculator),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedCalculators.add(calculator);
                          } else {
                            _selectedCalculators.remove(calculator);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade100,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
