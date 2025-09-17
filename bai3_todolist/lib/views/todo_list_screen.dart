import 'package:bai3_todolist/controllers/todo_controller.dart';
import 'package:bai3_todolist/main.dart';
import 'package:bai3_todolist/models/todo.dart';
import 'package:bai3_todolist/views/todo_detail_screen.dart';
import 'package:flutter/material.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoController _controller = new TodoController();

  Future<List<Todo>> _loadTodo() async => await _controller.getTodo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ứng dụng TODO')),
      body: FutureBuilder<List<Todo>>(
        future: _loadTodo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData != snapshot.data!.isEmpty) {
            return const Center(child: Text("Chưa công việc nào"));
          }

          final todos = snapshot.data;
          return ListView.builder(
            itemCount: todos!.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.des ?? ""),
                trailing: Icon(
                  todo.isCompleted == 1
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: todo.isCompleted == 1 ? Colors.green : Colors.grey,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => TodoDetailScreen(todo: todo),
                  //   ),
                  // ).then((_) => setState(() {}));
                },
                onLongPress: () {
                  // setState(() {
                  //   _controller.deleteTodo(todo.id!);
                  // });
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_)=> const AddTodoScreen()),
          //   ).then((_)=>setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
