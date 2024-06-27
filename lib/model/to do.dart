import 'package:flutter/cupertino.dart';

class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText:"Mayank",isDone: true),
      ToDo(id: '02', todoText:"Sahil",isDone: true),
      ToDo(id: '03', todoText:"Sumit"),
      ToDo(id: '04', todoText:"Helly"),
      ToDo(id: '05', todoText:"Dyaa"),
      ToDo(id: '06', todoText:"Sumit"),
      ToDo(id: '07', todoText:"Harshil"),
    ];
  }
}