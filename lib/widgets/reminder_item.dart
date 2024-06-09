import 'package:flutter/material.dart';
import 'package:justpassapp/model/reminders.dart';

class ToDoItem extends StatefulWidget {
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
  State<ToDoItem> createState() => _ToDoItemState();
}

Color binColor = Colors.black;

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // print('Clicked on Todo Item.');
        widget.onToDoChanged(widget.todo);
      },
      leading: Icon(
        widget.todo.isDone ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: Color(0xff4990E2),
      ),
      title: Text(
        widget.todo.todoText!,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          decoration: widget.todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 35,
        width: 35,
        child: IconButton(
          iconSize: 18,
          icon: Icon(
            Icons.delete,
            color: binColor,
          ),
          onPressed: () {
            widget.onDeleteItem(widget.todo.id);
          },
        ),
      ),
    );
  }
}
