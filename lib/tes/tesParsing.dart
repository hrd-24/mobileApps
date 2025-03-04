import 'package:flutter/material.dart';

class Parsing extends StatelessWidget {
  final String username;
  final String password;
  final String phoneNumber;

  // Constructor to receive data
  Parsing({required this.username, required this.password, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsing Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Password: $password'),
            Text('Phone Number: $phoneNumber'),
          ],
        ),
      ),
    );
  }
}
