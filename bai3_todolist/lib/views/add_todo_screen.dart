import 'package:bai3_todolist/controllers/todo_controller.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  String _selectDate = "";
  bool _isCompleted = false;
  final _todocontroller = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thêm công việc")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Tiêu đề",
                hintText: "Nhập đầu công việc",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 14),

            TextField(
              controller: _desController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Mô tả công việc",
                hintText: "Nhiếu nhất 3 dòng",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 14),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Hạn hoàn thành",
                hintText: _selectDate ?? "Chọn ngày: ",
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              onTap: () {
                setState(() async {
                  _selectDate = "20/08/2025";
                });
              },
            ),

            SizedBox(height: 14),

            Row(children: [
            const Text("Chưa hoành thành"),
            Switch(
              value: _isCompleted,
               onChanged: (val){
                setState(() {
                  _isCompleted = val;
                });
               },
               ),
               ],
            )
            ,
          ],
        ),
      ),
    );
  }
}
