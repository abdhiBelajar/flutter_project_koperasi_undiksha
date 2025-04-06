import 'package:flutter/material.dart';

class PembayaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Pembayaran Tagihan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(labelText: "Jenis Tagihan")),
            TextField(decoration: InputDecoration(labelText: "Jumlah"), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Bayar", style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}