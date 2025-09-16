import 'dart:async';

import 'package:bai3_todolist/models/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance ;

  static Database? _database;
  
   DbHelper._internal();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database= await _initDB("todos.db");
    return _database!;
  }
  
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _creataDB,
    );
  }
  

  Future _creataDB(Database db, int version)  async {
    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        dueDate TEXT,
        isCompleted INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertTodo(Todo todo) async{
    final db = await database;
    return await db.insert('todos',
     todo.toMap(),
     conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTodo() async{
    final db = await database;
    final List<Map<String,dynamic>> maps = await db.query('todos');

    return List.generate(maps.length,(i) {
        return Todo.fromMap(maps[i]);
    });
  }

  Future<int> updateTodo(Todo todo) async{
      final db = await database;
      return await db.update('todos',
      todo.toMap(),
      where: "id = ? ",
      whereArgs: [todo.id] 
      );
  } 

  Future<int> deleteTodo(Todo todo) async{
      final db = await database;
      return await db.delete('todos',
      where: "id = ? ",
      whereArgs: [todo.id] 
      );
  } 
}