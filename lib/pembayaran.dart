import 'package:flutter/material.dart';
import 'package:flutter_project_home/mutasi.dart'; // Import MutasiPage
import 'package:flutter_project_home/home.dart'; // Import HomePage
import 'package:provider/provider.dart'; // Import provider
import 'nasabah_provider.dart'; // Import NasabahProvider

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final TextEditingController jenisTagihanController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();

  void _prosesPembayaran() async {
    final String jenisTagihan = jenisTagihanController.text;
    final String jumlah = jumlahController.text;

    if (jenisTagihan.isNotEmpty && jumlah.isNotEmpty) {
      // Mengambil saldo dari provider
      final nasabahProvider = Provider.of<NasabahProvider>(
        context,
        listen: false,
      );
      double saldo = nasabahProvider.saldo;

      double jumlahPembayaran = double.parse(jumlah);
      if (saldo >= jumlahPembayaran) {
        // Update saldo setelah pembayaran
        saldo -= jumlahPembayaran;
        await nasabahProvider.updateSaldo(
          saldo,
        ); // Update saldo melalui provider

        // Menyimpan transaksi jika pembayaran berhasil
        List<String> transaksi = nasabahProvider.transaksi;
        transaksi.add('Pembayaran: $jenisTagihan - Rp $jumlah');
        await nasabahProvider.updateTransaksi(
          transaksi,
        ); // Menyimpan transaksi melalui provider

        // Menampilkan dialog sukses
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Transaksi Berhasil'),
              content: Text('Pembayaran Anda berhasil!'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigasi ke halaman Mutasi
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MutasiPage()),
                    );
                  },
                  child: Text('Lihat Riwayat Transaksi'),
                ),
                TextButton(
                  onPressed: () {
                    // Navigasi kembali ke halaman Home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Kembali ke Halaman Utama'),
                ),
              ],
            );
          },
        );

        // Clear input fields
        jenisTagihanController.clear();
        jumlahController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Saldo tidak cukup untuk transfer')),
        );
        return;
      }
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
        title: Text("Pembayaran", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Pembayaran Tagihan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Jenis Tagihan Field
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
                controller: jenisTagihanController,
                decoration: InputDecoration(
                  labelText: "Jenis Tagihan",
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            // Jumlah Pembayaran Field
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
                controller: jumlahController,
                decoration: InputDecoration(
                  labelText: "Jumlah",
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            // Button to Submit
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _prosesPembayaran,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text("Bayar", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
