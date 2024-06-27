// models/todo_lists.dart
class Todofinal {
  String? id;
  String todoText;
  bool isdone;

  Todofinal({
    required this.id,
    required this.todoText,
    this.isdone = false
  });
  static List<Todofinal> search = [];
}