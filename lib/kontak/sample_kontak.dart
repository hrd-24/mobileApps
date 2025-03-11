import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppkd_aps/kontak/db/db_kontak.dart';



class SampleKontak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite CRUD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotePage(),
    );
  }
}

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Note> notes = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  void refreshNotes() async {
    final data = await dbHelper.getNotes();
    setState(() {
      notes = data;
    });
  }

  void addOrUpdateNote({Note? note}) {
    titleController.text = note?.title ?? "";
    descriptionController.text = note?.description ?? "";
    genderController.text = note?.jenisKelamin ?? "";
    hobbyController.text = note?.hobi ?? "";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(note == null ? "Tambah Kontak" : "Edit Kontak"),
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Dalam build method atau dialog:
                    CustomTextField(controller: titleController, label: "Nama"),
                    CustomAngkaField(controller: descriptionController, label: 'Nomor'),
                    CustomTextField(controller: genderController,label: "Jenis kelamin",),
                    CustomTextField(controller: hobbyController, label: "Hobi"),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Batal"),
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (note == null) {
                      await dbHelper.insertNote(
                        Note(
                          title: titleController.text,
                          description: descriptionController.text,
                          jenisKelamin: genderController.text,
                          hobi: hobbyController.text,
                        ),
                      );
                    } else {
                      await dbHelper.updateNote(
                        Note(
                          id: note.id,
                          title: titleController.text,
                          description: descriptionController.text,
                          jenisKelamin: genderController.text,
                          hobi: hobbyController.text,
                        ),
                      );
                    }
                    refreshNotes();
                    Navigator.pop(context);
                  }
                },
                child: Text("Simpan"),
              ),
            ],
          ),
    );
  }

  void deleteNote(int id) async {
    await dbHelper.deleteNote(id);
    refreshNotes();
  }

  void showNoteDetails(Note note) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Detail Kontak"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Nama: ${note.title}"),
                Text("Nomor: ${note.description}"),
                Text("Jenis Kelamin: ${note.jenisKelamin}"),
                Text("Hobi: ${note.hobi}"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Tutup"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Kontak")),
      body: Container(
        color: Colors.grey[400],
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Card(
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                onTap: () => showNoteDetails(note), // Klik untuk melihat detail
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => addOrUpdateNote(note: note),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteNote(note.id!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addOrUpdateNote(),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType =
        TextInputType.text, // Default keyboard type adalah teks biasa
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      validator:
          validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return "$label tidak boleh kosong";
            }
            return null;
          },
    );
  }
}


class CustomAngkaField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  
  const CustomAngkaField({
    Key? key,
    required this.controller,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number, // Menampilkan keyboard angka
      decoration: InputDecoration(labelText: label),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Hanya angka
      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return "$label tidak boleh kosong";
            }
            if (!RegExp(r'^[0-9]+$').hasMatch(value)) { // Validasi angka
              return "$label harus berupa angka";
            }
            return null;
          },
    );
  }
}
