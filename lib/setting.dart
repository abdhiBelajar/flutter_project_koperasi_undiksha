import 'package:flutter/material.dart';
import 'login.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Ganti Password"),
            onTap: () {
              // Aksi ganti password
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifikasi"),
            onTap: () {
              // Aksi notifikasi
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Tentang Aplikasi"),
            onTap: () {
              // Aksi tentang aplikasi
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Log Out", style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
