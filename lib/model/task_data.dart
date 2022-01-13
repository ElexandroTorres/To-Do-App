import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/model/task.dart';

class TaskData extends ChangeNotifier {
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
}
