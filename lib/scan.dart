import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan QR", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Arahkan kamera ke QR Code", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}