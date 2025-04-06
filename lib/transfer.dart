import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transfer", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Nomor Rekening Tujuan")),
            TextField(decoration: InputDecoration(labelText: "Jumlah Transfer"), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Kirim", style: TextStyle(color: Colors.blue),)),
          ],
        ),
      ),
    );
  }
}