import 'package:bai3_todolist/database/db_helper.dart';
import 'package:bai3_todolist/models/todo.dart';

class TodoController {
  final DbHelper _dbhelper = new DbHelper();

  Future<List<Todo>> getTodo() async {
    return await _dbhelper.getTodo();
  }

  Future<bool> addTodo(Todo todo) async {
    try {
      await _dbhelper.insertTodo(todo);
      return true;
    } catch (e) {
      print("lỗi cu ơi ");
      return false;
    }
  }

  Future<bool> updateTodo(Todo todo) async {
    try {
      await _dbhelper.updateTodo(todo);
      return true;
    } catch (e) {
      print("lỗi update");
      return false;
    }
  }

  Future<bool> deleteTodo(int id) async {
    try {
      await _dbhelper.deleteTodo(id);
      return true;
    } catch (e) {
      print("lỗi delete");
      return false;
    }
  }
}
