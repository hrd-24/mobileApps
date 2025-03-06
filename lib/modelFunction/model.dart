import 'package:flutter/material.dart';
import 'package:ppkd_aps/data/modelName.dart';

class ModelScreen extends StatelessWidget {
  const ModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Screen'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: modelName.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(modelName[index].nameSchool),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(modelName[index].address),
                Text(modelName[index].phone),
              ],
            ),
          );
        },
      ),
    );
  }
}
