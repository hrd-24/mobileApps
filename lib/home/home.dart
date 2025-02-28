import 'package:flutter/material.dart';
import 'package:ppkd_aps/data/list_name.dart';

class HomeScreen extends StatelessWidget {
 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.yellow,
      ),      body: ListView.builder(
        itemCount: listName.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listName[index]),
          );
        },
      ),
    );
  }
}
