import 'package:flutter/material.dart';
import 'package:ppkd_aps/data/map_name.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: const Text('Business Screen'),
        backgroundColor: const Color.fromARGB(255, 235, 93, 83),
      ),      body: ListView.builder(
        itemCount: mapName.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(mapName[index]['name']),
            subtitle: Text(
              '${mapName[index]['address']}, ${mapName[index]['city']}, ${mapName[index]['state']} ${mapName[index]['zip']}',
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(mapName[index]['phone']),
                Text(mapName[index]['email']),
              ],
            ),
          );
        },
      ),
    );
  }
}
