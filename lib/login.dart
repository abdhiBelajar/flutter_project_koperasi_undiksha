import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'daftar.dart'; // Import DaftarPage
import 'forgot.dart'; // Import LupaPasswordPage
import 'nasabah_provider.dart'; // Import NasabahProvider

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    if (usernameController.text == 'abi' && passwordController.text == '') {
      // Menggunakan provider untuk menyimpan username
      final nasabahProvider = Provider.of<NasabahProvider>(
        context,
        listen: false,
      );
      await nasabahProvider.updateUsername(
        usernameController.text,
      ); // Update username melalui provider

      // Simpan status login ke SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_logged_in', true); // Tandai sebagai sudah login

      // Arahkan ke halaman HomePage setelah login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Username atau password salah!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koperasi Undiksha", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    'images/undiksha1.png', // Gambar logo Undiksha
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Tambahkan tombol untuk navigasi ke halaman daftar dan lupa password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman daftar
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DaftarPage()),
                        );
                      },
                      child: Text(
                        'Belum punya akun? Daftar',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman lupa password
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LupaPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 300),
                Text(
                  "copyright @2025 by Undiksha",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
