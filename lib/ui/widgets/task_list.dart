import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/ui/widgets/task_item.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskItem(
          taskName: Provider.of<TaskData>(context).tasks[index].name,
          taskIsComplete:
              Provider.of<TaskData>(context).tasks[index].isComplete,
          checkBoxChanged: (value) {
            /*
            setState(() {
              Provider.of<TaskData>(context).tasks[index].changeTaskState();
            });
            */
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
