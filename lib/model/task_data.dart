import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'comprar ovos', isComplete: true),
    Task(name: 'Limpar a casa'),
    Task(name: 'Cozinhas'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String name) {
    final newTask = Task(name: name);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeTaskState();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
