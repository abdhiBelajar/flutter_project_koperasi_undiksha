import 'package:flutter/material.dart';

class PinjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pinjaman", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Ajukan Pinjaman", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(labelText: "Jumlah Pinjaman"), keyboardType: TextInputType.number),
            TextField(decoration: InputDecoration(labelText: "Lama Pinjaman (bulan)")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Ajukan", style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}