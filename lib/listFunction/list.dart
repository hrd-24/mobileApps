import 'package:flutter/material.dart';
import 'package:ppkd_aps/data/list_name.dart';

class ListScreen extends StatelessWidget {
 
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: const Text('List Screen'),
        backgroundColor: Colors.yellow,
      ),     
       body: ListView.builder(
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
