import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.lock), title: Text("Ganti Password"), onTap: () {}),
          ListTile(leading: Icon(Icons.notifications), title: Text("Notifikasi"), onTap: () {}),
          ListTile(leading: Icon(Icons.info), title: Text("Tentang Aplikasi"), onTap: () {}),
        ],
      ),
    );
  }
}
