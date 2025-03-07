import 'package:flutter/material.dart';
import 'package:ppkd_aps/dropdown/dropDownMain.dart';
import 'package:ppkd_aps/mapFunction/map.dart';
import 'package:ppkd_aps/stack/stack_screen.dart';
import 'package:ppkd_aps/drawer/drawer.dart';
import 'package:ppkd_aps/grid/gridView.dart';
import 'package:ppkd_aps/listFunction/list.dart';
import 'package:ppkd_aps/modelFunction/model.dart';
import 'package:ppkd_aps/tes/tes.dart';
import 'package:ppkd_aps/tugas_figma/lib/figma.dart';

// void main() => runApp(const BottomNavigationBarExampleApp());

// class BottomNavigationBarExampleApp extends StatelessWidget {
//   const BottomNavigationBarExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: BottomNavigationBarExample());
//   }
// }

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    DrawerScreen(), // Reference the DrawerScreen widget
    HomeScreen(), // Reference the DropdownMenuExample widget
    // ListScreen(), // Reference the HomeScreen widget
    // MapScreen(), // Reference the BusinessScreen widget
    // ModelScreen(), // Reference the SchoolScreen widget
    StackScreen(), // Reference the StackScreen widget
    GridScreen(), // Reference the GridScreen widget
    TesScreen(), // Reference the GridScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Drawer'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Quis'),
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'List'),
          // BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Map',),
          // BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Model'),
          BottomNavigationBarItem(icon: Icon(Icons.table_bar), label: 'Stack'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: 'Grid'),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: 'Tes Page'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
