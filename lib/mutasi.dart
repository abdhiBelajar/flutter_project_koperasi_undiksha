import 'package:flutter/material.dart';

class MutasiPage extends StatelessWidget {
  final List<String> _mutasi = [
    "Transfer ke 1234567890 - Rp 200.000",
    "Setoran Tunai - Rp 500.000",
    "Pembayaran Listrik - Rp 150.000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mutasi Rekening", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue,),
      body: ListView.separated(
        itemCount: _mutasi.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.receipt_long, color: Colors.blue),
          title: Text(_mutasi[index]),
        ),
      ),
    );
  }
}