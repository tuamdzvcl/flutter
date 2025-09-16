import 'package:flutter/material.dart';

class Todo {
  int? id;
  String title;
  String? des;
  DateTime? dueDate;
  int isCompleted;

  Todo({
    this.id,
    required this.title,
    this.des,
    this.dueDate,
    this.isCompleted=0
  });

  factory Todo.fromMap(Map<String,dynamic> map)
  {
    return Todo(
    id: map['id'],
    title: map['title'],
    des: map['des'],
    dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']):null,
    isCompleted: map['isCompleted'] ?? 0,
    );
  }
  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'title':title,
      'des':des,
      'dueDate': dueDate,
      'iscompleted':isCompleted
      };
  }
}
