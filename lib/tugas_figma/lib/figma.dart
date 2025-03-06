import 'package:flutter/material.dart';
import 'package:ppkd_aps/tugas_figma/lib/screens/tampilandua.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/LoginScreen.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten di atas background
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/Group3.png',
                    width: 160,
                    height: 160,
                  ),
                  SizedBox(height: 100),
              
                  // Label untuk TextField
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Enter your name',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Baloo_2',
                      ),
                    ),
                  ),
              
                  SizedBox(height: 10),
              
                  // TextField tanpa background solid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "John Deh...",
                        hintStyle: TextStyle(color: Colors.white70, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(
                              0.5,
                            ), // Transparan sesuai background
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(
                              0.5,
                            ), // Sama seperti di atas
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color:
                                Colors.white, // Saat diklik tetap terlihat jelas
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
              
                  SizedBox(height: 200),
              
                  // Tombol Navigasi ke Tampilandua dengan ukuran sama seperti TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF8C660),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tampilandua(),
                            ),
                          );
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
