// home.dart (Versi dikembangkan)
import 'package:flutter/material.dart';
import 'saldo.dart';
import 'transfer.dart';
import 'deposito.dart';
import 'pembayaran.dart';
import 'pinjaman.dart';
import 'mutasi.dart';
import 'setting.dart';
import 'scan.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koperasi Undiksha", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('images/Abi.jpg'),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nasabah", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                              Text("I Gusti Made Abdhi Permana Putra", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Total Saldo Anda", style: TextStyle(color: Colors.grey)),
                              Text("Rp. 1.200.000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildMenuItem(context, Icons.account_balance_wallet, "Cek Saldo", SaldoPage()),
                        _buildMenuItem(context, Icons.send, "Transfer", TransferPage()),
                        _buildMenuItem(context, Icons.savings, "Deposito", DepositoPage()),
                        _buildMenuItem(context, Icons.payment, "Pembayaran", PembayaranPage()),
                        _buildMenuItem(context, Icons.money, "Pinjaman", PinjamanPage()),
                        _buildMenuItem(context, Icons.history, "Mutasi", MutasiPage()),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: Column(
                      children: [
                        Text("Butuh Bantuan?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 5),
                        Text("0848-1334-1054", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomNavItem(context, Icons.settings, "Setting", SettingsPage()),
                _buildBottomNavItem(context, Icons.qr_code, "Scan", ScanPage()),
                _buildBottomNavItem(context, Icons.person, "Profile", ProfilePage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }
}
