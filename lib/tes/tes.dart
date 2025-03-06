import 'package:flutter/material.dart';
import 'package:ppkd_aps/tes/tesParsing.dart';

class TesScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tes Screen'),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_dark.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for icons (Home, Star, and Settings)
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // IconButton for Star (No data passed, only navigation)
                Icon(Icons.home, size: 100, color: Colors.yellow),
                // IconButton for Star (No data passed, only navigation)
                Icon(Icons.star, size: 100, color: Colors.yellow),
                // IconButton for Settings (No data passed, only navigation)
                Icon(Icons.settings, size: 100, color: Colors.yellow),
                ],
              ),
              ),
              SizedBox(height: 20), // Add space between Row and Column
              // Column to collect user input
              Column(
              children: <Widget>[
                TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                ),
                ),
                TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
                ),
                TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),

                // Submit Button (Only this button will pass data)
                ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String phoneNumber = _phoneNumberController.text;

                  // Navigate to Parsing screen and pass the data
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Parsing(
                    username: username,
                    password: password,
                    phoneNumber: phoneNumber,
                    ),
                  ),
                  );
                },
                child: Text("Submit"),
                ),
              ],
              ),
              
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // IconButton for Star (No data passed, only navigation)
                Icon(Icons.home, size: 100, color: Colors.yellow),
                // IconButton for Star (No data passed, only navigation)
                Icon(Icons.star, size: 100, color: Colors.yellow),
                // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.one_k,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.web,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.safety_check,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.face,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.baby_changing_station,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.gpp_good,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(
                  Icons.assist_walker,
                  size: 100,
                  color: Colors.yellow,
                ), // IconButton for Settings (No data passed, only navigation)
                Icon(Icons.settings, size: 100, color: Colors.yellow),
                ],
              ),
              ),
            ],
          ),
          )
        
        ],
      ),
    );
  }
}
