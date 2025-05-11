import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nasabah_provider.dart'; // Import the provider
import 'saldo.dart';
import 'transfer.dart';
import 'deposito.dart';
import 'pembayaran.dart';
import 'pinjaman.dart';
import 'mutasi.dart';
import 'setting.dart';
import 'scan.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Delay the saldo loading until the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load saldo after the widget is built
      Provider.of<NasabahProvider>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access saldo from the provider
    final saldo = Provider.of<NasabahProvider>(context).saldo;

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
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
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
                              Text(
                                "Nasabah",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "I Gusti Made Abdhi Permana Putra",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Total Saldo Anda",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "Rp. ${saldo.toStringAsFixed(0)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
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
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildMenuItem(
                          context,
                          Icons.account_balance_wallet,
                          "Cek Saldo",
                          SaldoPage(),
                        ),
                        _buildMenuItem(
                          context,
                          Icons.send,
                          "Transfer",
                          TransferPage(),
                        ),
                        _buildMenuItem(
                          context,
                          Icons.savings,
                          "Deposito",
                          DepositoPage(),
                        ),
                        _buildMenuItem(
                          context,
                          Icons.payment,
                          "Pembayaran",
                          PembayaranPage(),
                        ),
                        _buildMenuItem(
                          context,
                          Icons.money,
                          "Pinjaman",
                          PinjamanPage(),
                        ),
                        _buildMenuItem(
                          context,
                          Icons.history,
                          "Mutasi",
                          MutasiPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Customer Service Section
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.phone_in_talk, color: Colors.blue, size: 28),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Butuh Bantuan?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '0848-1334-1054',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
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
                _buildBottomNavItem(
                  context,
                  Icons.settings,
                  "Setting",
                  SettingsPage(),
                ),
                _buildBottomNavItem(context, Icons.qr_code, "Scan", ScanPage()),
                _buildBottomNavItem(
                  context,
                  Icons.person,
                  "Profile",
                  ProfilePage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String label,
    Widget page,
  ) {
    return GestureDetector(
      onTap:
          () =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
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

  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    Widget page,
  ) {
    return GestureDetector(
      onTap:
          () =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
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
