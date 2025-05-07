import 'dart:developer';

import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DbHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) return;
    try {
      String path = "${await getDatabasesPath()}tasks.db";
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title STRING,
              note TEXT,
              date STRING,
              startTime STRING,
              endTime STRING,
              remind INTEGER,
              repeat STRING,
              color INTEGER,
              isCompleted INTEGER
            )
            ''');
        },
      );
    } catch (e) {
      log("Error initializing DB: $e");
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<int> update(int id, Map<String, dynamic> updatedData) async {
    return await _db!.update(
      _tableName,
      updatedData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> delete(int id) async {
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    // final List<Map<String, dynamic>> tasks = await _db!.query(_tableName);
    return await _db!.query(_tableName);
  }
}
