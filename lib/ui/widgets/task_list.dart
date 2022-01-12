import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/ui/widgets/task_item.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'comprar ovos', isComplete: true),
    Task(name: 'Limpar a casa'),
    Task(name: 'Cozinhas'),
    Task(name: 'comprar ovos'),
    Task(name: 'Limpar a casa', isComplete: true),
    Task(name: 'Cozinhas'),
    Task(name: 'comprar ovos', isComplete: true),
    Task(name: 'Limpar a casa'),
    Task(name: 'Cozinhas'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskItem(
          taskName: tasks[index].name,
          taskIsComplete: tasks[index].isComplete,
          checkBoxChanged: (value) {
            setState(() {
              tasks[index].changeTaskState();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
