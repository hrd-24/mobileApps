import 'package:flutter/material.dart';
import 'package:ppkd_aps/data/list_name.dart'; // Impor listName dari list_name.dart
import 'package:collection/collection.dart';

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Center(child: DropdownMenuExample())
            ],
        ),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  // Menggunakan listName dari list_name.dart
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    listName.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)).toList(),
  );

  // Default nilai dropdown pertama dari listName
  String dropdownValue = listName.first;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownMenu<String>(
        initialSelection: dropdownValue,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: menuEntries,
      ),
    );
  }
}



class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          tristate: true,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        Checkbox(
          isError: true,
          tristate: true,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        Checkbox(isError: true, tristate: true, value: isChecked, onChanged: null),
      ],
    );
  }
}