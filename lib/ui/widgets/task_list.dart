import 'package:flutter/material.dart';
import 'package:to_do_app/ui/widgets/task_item.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskItem(
              taskName: taskData.tasks[index].name,
              taskIsComplete: taskData.tasks[index].isComplete,
              checkBoxChanged: (value) {
                taskData.updateTask(taskData.tasks[index]);
              },
              dismisibleDelete: (direction) {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
