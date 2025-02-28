import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:MediaQuery.of(context).size.width>= 500?5: 2,
            mainAxisSpacing: 50.0,
            crossAxisSpacing: 50.0,
            childAspectRatio: 1/1.25,
          ),
          itemCount: 100,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Image.network('https://picsum.photos/250?image=9'),
                Text('Item $index'),
              ],
            );
          },
          // Create a grid with 2 columns.
          // If you change the scrollDirection to horizontal,
          // this produces 2 rows.
          // Generate 100 widgets that display their index in the list.
        ),
      ),
    );
  }
}


