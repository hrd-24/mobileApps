import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          Container(color: Colors.yellow),
          Container(margin: EdgeInsets.all(10.0), color: Colors.red),
          Container(margin: EdgeInsets.all(20.0), color: Colors.green),
          Container(margin: EdgeInsets.all(30.0), color: Colors.blue),
          Container(margin: EdgeInsets.all(40.0), color: Colors.orange),
          Container(margin: EdgeInsets.all(50.0), color: Colors.purple),
        ],
      ),
    );
  }
}
