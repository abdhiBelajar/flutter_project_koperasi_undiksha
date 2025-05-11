import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NasabahProvider with ChangeNotifier {
  double _saldo = 500000.0;
  String _username = '';
  List<String> _transaksi = []; // Menambahkan properti transaksi

  double get saldo => _saldo;
  String get username => _username;
  List<String> get transaksi =>
      _transaksi; // Menambahkan getter untuk transaksi

  // Load data from SharedPreferences
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _saldo = prefs.getDouble('saldo') ?? 500000.0;
    _username = prefs.getString('username') ?? '';
    _transaksi =
        prefs.getStringList('transaksi') ??
        []; // Memuat transaksi dari SharedPreferences
    notifyListeners();
  }

  // Update saldo dan notify listeners
  Future<void> updateSaldo(double amount) async {
    _saldo = amount;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('saldo', _saldo);
    notifyListeners();
  }

  // Update username dan notify listeners
  Future<void> updateUsername(String username) async {
    _username = username;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    notifyListeners();
  }

  // Menambahkan transaksi dan notify listeners
  Future<void> updateTransaksi(List<String> newTransaksi) async {
    _transaksi = newTransaksi;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'transaksi',
      _transaksi,
    ); // Menyimpan transaksi ke SharedPreferences
    notifyListeners();
  }
}
