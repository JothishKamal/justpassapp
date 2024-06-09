import 'package:flutter/material.dart';
import 'package:justpassapp/model/reminders.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // print('Clicked on Todo Item.');
        onToDoChanged(todo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: const Icon(
        Icons.radio_button_unchecked,
        color: Color(0xff4990E2),
      ),
      title: Text(
        todo.todoText!,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 35,
        width: 35,
        child: IconButton(
          color: Colors.black,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: () {
            // print('Clicked on delete icon');
            onDeleteItem(todo.id);
          },
        ),
      ),
    );
  }
}
