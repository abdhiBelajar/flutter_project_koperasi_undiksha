import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Make sure to import shared_preferences
import 'nasabah_provider.dart'; // Import the provider
import 'home.dart';
import 'login.dart';
import 'pembayaran.dart';
import 'scan.dart';
import 'setting.dart';
import 'transfer.dart';
import 'deposito.dart';
import 'pinjaman.dart';
import 'mutasi.dart';
import 'profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('is_logged_in') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (_) => NasabahProvider()..loadData(), // Load initial data
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : LoginPage(), // Remove 'const' here
      routes: {
        '/login': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/pembayaran': (_) => PembayaranPage(),
        '/scan': (_) => ScanPage(),
        '/setting': (_) => SettingsPage(),
        '/transfer': (_) => TransferPage(),
        '/deposito': (_) => DepositoPage(),
        '/pinjaman': (_) => PinjamanPage(),
        '/mutasi': (_) => MutasiPage(),
        '/profile': (_) => ProfilePage(),

        // Add other routes
      },
    );
  }
}
