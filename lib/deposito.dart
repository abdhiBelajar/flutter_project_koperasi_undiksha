import 'package:flutter/material.dart';

class DepositoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deposito", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Deposito Berjangka", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: "Jumlah Deposito"), keyboardType: TextInputType.number),
            TextField(decoration: InputDecoration(labelText: "Jangka Waktu (bulan)")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Simpan", style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}
