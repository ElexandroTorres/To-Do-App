import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/model/task_data.dart';
import 'package:to_do_app/ui/screens/task_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'My ToDo App',
        home: TaskPage(),
      ),
    );
  }
}
