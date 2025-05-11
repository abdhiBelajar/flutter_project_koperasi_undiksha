import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'nasabah_provider.dart'; // Import NasabahProvider

class PinjamanPage extends StatelessWidget {
  final TextEditingController jumlahPinjamanController =
      TextEditingController();
  final TextEditingController lamaPinjamanController = TextEditingController();

  PinjamanPage({super.key});

  void _ajukanPinjaman(BuildContext context) async {
    final String jumlahPinjaman = jumlahPinjamanController.text;
    final String lamaPinjaman = lamaPinjamanController.text;

    if (jumlahPinjaman.isNotEmpty && lamaPinjaman.isNotEmpty) {
      double jumlah = double.parse(jumlahPinjaman);
      // Mengambil saldo dari provider
      final nasabahProvider = Provider.of<NasabahProvider>(
        context,
        listen: false,
      );
      double saldo = nasabahProvider.saldo;

      // Menambah saldo berdasarkan pinjaman yang diajukan
      saldo += jumlah;
      await nasabahProvider.updateSaldo(saldo); // Update saldo melalui provider

      // Menambahkan transaksi baru ke daftar transaksi
      List<String> transaksi = nasabahProvider.transaksi;
      transaksi.add('Pinjaman: Rp $jumlah untuk $lamaPinjaman bulan');
      await nasabahProvider.updateTransaksi(
        transaksi,
      ); // Menyimpan transaksi melalui provider

      // Menampilkan dialog sukses
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pinjaman Berhasil'),
            content: Text(
              'Pinjaman Anda sebesar Rp $jumlah telah berhasil disetujui!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Menutup dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // Clear input fields
      jumlahPinjamanController.clear();
      lamaPinjamanController.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Harap isi semua kolom')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajukan Pinjaman", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Ajukan Pinjaman",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: jumlahPinjamanController,
                decoration: InputDecoration(
                  labelText: "Jumlah Pinjaman",
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: lamaPinjamanController,
                decoration: InputDecoration(
                  labelText: "Lama Pinjaman (bulan)",
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _ajukanPinjaman(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "Ajukan Pinjaman",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
