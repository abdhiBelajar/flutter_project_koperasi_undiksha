import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  void _getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 4, // Border width
                    ),
                    borderRadius: BorderRadius.circular(50), // Circular border
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    backgroundImage: AssetImage('images/Abi.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Username:",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                username,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Email:",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "example@undiksha.ac.id",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "No. HP:",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "081234567890",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
