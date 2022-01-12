import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        padding: EdgeInsets.all(16),
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text('titulo'),
        value: true,
        secondary: CircleAvatar(
          child: Icon(Icons.check),
        ),
        onChanged: (value) {
          //função
        },
      ),
      onDismissed: (direction) {},
    );
  }
}
