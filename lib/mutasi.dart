import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'nasabah_provider.dart'; // Import NasabahProvider

class MutasiPage extends StatefulWidget {
  const MutasiPage({super.key});

  @override
  _MutasiPageState createState() => _MutasiPageState();
}

class _MutasiPageState extends State<MutasiPage> {
  @override
  void initState() {
    super.initState();
    // Memanggil loadData dari NasabahProvider untuk memuat transaksi dari SharedPreferences
    Provider.of<NasabahProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil daftar transaksi dari provider
    final mutasi = Provider.of<NasabahProvider>(context).transaksi;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mutasi Rekening", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body:
          mutasi.isEmpty
              // Jika tidak ada transaksi, tampilkan pesan kosong
              ? Center(
                child: Text(
                  "Tidak ada riwayat transaksi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
              : ListView.builder(
                itemCount: mutasi.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.receipt_long, color: Colors.blue),
                    title: Text(mutasi[index]),
                  );
                },
              ),
    );
  }
}
