import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Kontrol untuk teks input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk memproses login (misal hanya print data)
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Untuk tujuan demonstrasi, hanya mencetak username dan password
    print("Username: $username, Password: $password");

    // Bisa tambahkan logika autentikasi login di sini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ganti dengan ikon "back"
          onPressed: () {
            Navigator.pop(context); // Aksi untuk tombol back
          },
        ),
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Input username
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Input password
            TextField(
              controller: _passwordController,
              obscureText: true, // Menyembunyikan teks password
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Tombol login
            ElevatedButton(onPressed: _login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
