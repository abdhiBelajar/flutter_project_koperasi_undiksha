import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'nasabah_provider.dart'; // Import NasabahProvider

class SaldoPage extends StatefulWidget {
  const SaldoPage({super.key});

  @override
  _SaldoPageState createState() => _SaldoPageState();
}

class _SaldoPageState extends State<SaldoPage> {
  @override
  void initState() {
    super.initState();
    // Memanggil loadData dari NasabahProvider untuk memuat saldo dari SharedPreferences
    Provider.of<NasabahProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil saldo dari provider
    final saldo = Provider.of<NasabahProvider>(context).saldo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saldo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20), // Padding untuk konten
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Saldo Anda',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Rp ${saldo.toStringAsFixed(0)}', // Menampilkan saldo dengan format ribuan
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
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
