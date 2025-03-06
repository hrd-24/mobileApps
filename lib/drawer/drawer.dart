import 'package:flutter/material.dart';
import 'package:ppkd_aps/data/list_name.dart'; // Pastikan listName ada
import 'package:ppkd_aps/data/map_name.dart'; // Pastikan mapName ada
import 'package:ppkd_aps/data/modelName.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _selectedSchool = listName.first; // Default Dropdown Value
  bool _isVisited = false; // ✅ Checkbox untuk status kunjungan sekolah
  String _schoolType = 'Negeri'; // ✅ RadioButton untuk kategori sekolah

  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  //=============================================== INDEX KE-0: LIST
  static final List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
      itemCount: listName.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(listName[index]),
        );
      },
    ),
  ];

  //=============================================== INDEX KE-1 & SETERUSNYA: MAPNAME & SCHOOL
  static final List<Widget> _ok = <Widget>[
    // ✅ Index ke-1: Business (mapName)
    ListView.builder(
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

    // ✅ Index ke-2: School (modelName)
    ListView.builder(
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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedSchool), // ✅ Tampilkan sekolah yang dipilih
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _selectedIndex == 0 ? _widgetOptions[0] : _ok[_selectedIndex - 1], // ✅ Sesuai permintaan
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Info Loker Pak'),
              accountEmail: Text('hrd@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/bg_d.jpg'),
              ),
            ),
            ListTile(
              title: const Text('List'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(), // Garis pemisah
            
            // 🔻 DROPDOWN UNTUK MEMILIH SEKOLAH 🔻
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                value: _selectedSchool,
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSchool = newValue!;
                  });
                },
                items: listName.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            // 🔻 CHECKBOX UNTUK STATUS KUNJUNGAN 🔻
            CheckboxListTile(
              title: const Text('Sudah dikunjungi?'),
              value: _isVisited,
              onChanged: (bool? newValue) {
                setState(() {
                  _isVisited = newValue!;
                });
              },
            ),

            // 🔻 RADIO BUTTON UNTUK MEMILIH KATEGORI SEKOLAH 🔻
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kategori Sekolah:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ListTile(
                    title: const Text('Negeri'),
                    leading: Radio<String>(
                      value: 'Negeri',
                      groupValue: _schoolType,
                      onChanged: (String? value) {
                        setState(() {
                          _schoolType = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Swasta'),
                    leading: Radio<String>(
                      value: 'Swasta',
                      groupValue: _schoolType,
                      onChanged: (String? value) {
                        setState(() {
                          _schoolType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
