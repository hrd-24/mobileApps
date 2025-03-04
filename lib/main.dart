import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppkd_aps/bottom.dart';
import 'package:ppkd_aps/createLogin/create.dart';
// import 'package:ppkd_aps/home/hello_world.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // Set LoginScreen as the home screen
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // These variables will hold the created account details
  String _createdUsername = '';
  String _createdPassword = '';
  // String _createdPhoneNumber = '';

// Function to handle login
void _login() {
  String username = _usernameController.text;
  String password = _passwordController.text;

  // Check if entered credentials match the default admin credentials
  if (username == 'admin' && password == '123') {
    // Successfully logged in, navigate to HelloWorld screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationBarExample()), // Navigate to HelloWorld
    );
  }
  // Else check if the entered credentials match the created account credentials
  else if (username == _createdUsername && password == _createdPassword) {
    // Successfully logged in, navigate to HelloWorld screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationBarExample()), // Navigate to HelloWorld
    );
  } else {
    // Show an error message if credentials are incorrect
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Failed"),
          content: Text("Invalid username or password."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


  // Navigate to the Create Account screen and get the created account data
  void _navigateToCreateAccount() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountPage()),
    );

    // If a new account is created, store the account data
    if (result != null) {
      setState(() {
        _createdUsername = result['username'];
        _createdPassword = result['password'];
        // _createdPhoneNumber = result['phoneNumber'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Konfirmasi"),
                  content: Text(
                    "Apakah Anda yakin ingin keluar dari aplikasi?",
                  ),
                  actions: [
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 41, 166, 204),
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
          Center(
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.black,
                      ),
                      Text(
                        "WELCOME BACK",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Login to your account",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Masukkan username",
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Masukkan password",
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(onPressed: _login, child: Text("Login")),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _navigateToCreateAccount, // Navigate to Create Account page
                        child: Text("Create Account"),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
