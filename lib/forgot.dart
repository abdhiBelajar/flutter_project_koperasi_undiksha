import 'package:flutter/material.dart';

class LupaPasswordPage extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lupa Password", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Reset Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Masukkan Email Terdaftar"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Kirim Link Reset")),
          ],
        ),
      ),
    );
  }
}