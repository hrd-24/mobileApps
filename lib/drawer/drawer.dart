import 'package:flutter/material.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.yellow,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(  
              accountName: Text('Info Loker Pak'),
              accountEmail: Text('hrd@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sip.jpg'),
              ),
            ),
           ListTile(
              title: Text('Login'),
             onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                // Handle item 3 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
