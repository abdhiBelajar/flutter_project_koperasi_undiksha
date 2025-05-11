import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'nasabah_provider.dart'; // Import NasabahProvider

class DepositoPage extends StatelessWidget {
  final TextEditingController jumlahDepositoController =
      TextEditingController();
  final TextEditingController jangkaWaktuController = TextEditingController();

  DepositoPage({super.key});

  // Fungsi untuk mengajukan deposito
  void _ajukanDeposito(BuildContext context) async {
    final String jumlahDeposito = jumlahDepositoController.text;
    final String jangkaWaktu = jangkaWaktuController.text;

    if (jumlahDeposito.isNotEmpty && jangkaWaktu.isNotEmpty) {
      double jumlah = double.parse(jumlahDeposito);

      // Mengambil saldo dari provider
      final nasabahProvider = Provider.of<NasabahProvider>(
        context,
        listen: false,
      );
      double saldo = nasabahProvider.saldo;

      // Mengecek apakah saldo cukup untuk deposito
      if (saldo >= jumlah) {
        // Mengurangi saldo sesuai jumlah deposito
        saldo -= jumlah;
        await nasabahProvider.updateSaldo(
          saldo,
        ); // Update saldo melalui provider

        // Menambahkan transaksi baru ke daftar transaksi
        List<String> transaksi = nasabahProvider.transaksi;
        transaksi.add('Deposito: Rp $jumlah untuk $jangkaWaktu bulan');
        await nasabahProvider.updateTransaksi(
          transaksi,
        ); // Menyimpan transaksi melalui provider

        // Menampilkan dialog sukses
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Deposito Berhasil'),
              content: Text(
                'Deposito Anda sebesar Rp $jumlah telah berhasil disetujui untuk jangka waktu $jangkaWaktu bulan!',
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
        jumlahDepositoController.clear();
        jangkaWaktuController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Saldo tidak cukup untuk deposito')),
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
        title: Text("Ajukan Deposito", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Ajukan Deposito Berjangka",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Jumlah Deposito Field
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
                controller: jumlahDepositoController,
                decoration: InputDecoration(
                  labelText: "Jumlah Deposito",
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            // Jangka Waktu Field
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
                controller: jangkaWaktuController,
                decoration: InputDecoration(
                  labelText: "Jangka Waktu (bulan)",
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _ajukanDeposito(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "Ajukan Deposito",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
