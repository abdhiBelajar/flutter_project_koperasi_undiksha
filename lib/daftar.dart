import 'package:flutter/material.dart';

class DaftarPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  DaftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar M-Banking", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Formulir Pendaftaran", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextFormField(decoration: InputDecoration(labelText: "Nama Lengkap")),
              TextFormField(decoration: InputDecoration(labelText: "Nomor HP"), keyboardType: TextInputType.phone),
              TextFormField(decoration: InputDecoration(labelText: "Email"), keyboardType: TextInputType.emailAddress),
              TextFormField(decoration: InputDecoration(labelText: "Password"), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text("Daftar")),
            ],
          ),
        ),
      ),
    );
  }
}
