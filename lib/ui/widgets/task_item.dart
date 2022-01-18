import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String taskName;
  final DateTime? taskDate;
  final bool taskIsComplete;
  final Function checkBoxChanged;
  final Function dismisibleDelete;

  const TaskItem(
      {Key? key,
      required this.taskName,
      this.taskDate,
      this.taskIsComplete = false,
      required this.checkBoxChanged,
      required this.dismisibleDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          padding: EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Colors.redAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
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
            activeColor: Colors.lightBlueAccent,
            onChanged: (value) => checkBoxChanged(value),
            value: taskIsComplete,
            secondary: Icon(Icons.ac_unit),
            title: Text(taskName),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            subtitle: Text(taskDate != null ? taskDate.toString() : '')),
        onDismissed: (direction) {
          dismisibleDelete(direction);
        });
  }
}
