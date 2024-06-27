import 'package:flutter/material.dart';

import 'package:to_do_list/todofinal.dart';

class TodoItem extends StatelessWidget {
  final Todofinal toddo;
  final ontodoChnaged;
  final deleteitem;
  const TodoItem({Key? key,required this.toddo,required this.ontodoChnaged,required this.deleteitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ListTile(
              onTap: () {
                ontodoChnaged(toddo);
              },

              tileColor: Colors.white,
              leading: Icon(toddo.isdone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.purple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(style: BorderStyle.solid),
              ),
              title: Text(
                toddo.todoText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: (toddo.isdone==true) ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.delete_sweep_sharp),
                    iconSize: 17,
                    onPressed: () {
                      deleteitem(toddo.id);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


