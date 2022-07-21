import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models/note.dart';


class DBHelper {
  Database _database;

  Future<Database> get dbInstance async {
    if (_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }
  
  initDB() async {
    return await openDatabase{
      join(await getDatabasesPath(), 'noteapp.db');
    }
  }
}