// saldo.dart
import 'package:flutter/material.dart';

class SaldoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek Saldo", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: Center(
        child: Text("Saldo Anda: Rp 1.200.000", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}