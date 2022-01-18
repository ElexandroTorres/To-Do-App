import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/services/data_storage.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  DataStorage dataStorage = DataStorage();

  void setList(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String name) {
    final newTask = Task(name: name);
    _tasks.add(newTask);
    dataStorage.saveData(_tasks);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeTaskState();
    dataStorage.saveData(_tasks);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    dataStorage.saveData(_tasks);
    notifyListeners();
  }
}
