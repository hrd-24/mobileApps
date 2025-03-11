// import 'package:example/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  int? id;
  String title;
  String description;
  String jenisKelamin;
  String hobi;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.jenisKelamin,
    required this.hobi,
  });
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)",
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute(
          "DROP TABLE IF EXISTS notes",
        ); // Hapus tabel lama jika ada
        return db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, jenisKelamin TEXT, hobi TEXT)",
        );
      },
    );
  }

  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.rawInsert(
      "INSERT INTO notes (title, description, jenisKelamin, hobi) VALUES (?, ?, ?, ?)",
      [note.title, note.description, note.jenisKelamin, note.hobi],
    );
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      "SELECT * FROM notes",
    );

    return result
        .map(
          (data) => Note(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            jenisKelamin: data['jenisKelamin'],
            hobi: data['hobi'],
          ),
        )
        .toList();
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return await db.rawUpdate(
      "UPDATE notes SET title = ?, description = ?, jenisKelamin = ?, hobi = ? WHERE id = ?",
      [note.title, note.description, note.jenisKelamin, note.hobi, note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.rawDelete("DELETE FROM notes WHERE id = ?", [id]);
  }
}
