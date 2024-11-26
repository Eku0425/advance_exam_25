import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/note_modal.dart';

class DBHelper {
  static DBHelper dbHelper = DBHelper._();
  DBHelper._();

  Database? _database;

  Future<Database?> get db async {
    if (_database != null) return _database!;
    _database = await createData();
    return _database!;
  }

  // CREATE
  Future<Database?> createData() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "item.db");

    _database = await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      String sql = '''
      CREATE TABLE item(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      heading TEXT NOT NULL,
      notes TEXT NOT NULL
      )
      ''';
      db.execute(sql);
    });
    return _database;
  }

  // INSERT
  Future<void> insertData(Notesmodal notesModel) async {
    final dbClient = await db;
    await dbClient!.insert('item', notesModel.toMap());
  }

  // UPDATE
  Future<void> updateData(Notesmodal notesModel) async {
    final dbClient = await db;
    await dbClient!.update(
      'item',
      notesModel.toMap(),
      where: 'id = ?',
      whereArgs: [notesModel.id],
    );
  }

  // DELETE
  Future<void> deleteData(int id) async {
    final dbClient = await db;
    await dbClient!.delete(
      'item',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> addFavourite(Notesmodal notesModel) async {
    final dbClient = await db;
    await dbClient!.insert('item', notesModel.toMap());
  }

  // READ
  Future<List<Notesmodal>> getItem() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('item');

    return List.generate(maps.length, (index) {
      return Notesmodal.fromMap(maps[index]);
    });
  }
}
