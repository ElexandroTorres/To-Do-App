import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/ui/widgets/add_task_bottom_sheet.dart';
import 'package:to_do_app/ui/widgets/task_item.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List _todoList = [];
  Map<String, dynamic> _lastRemoved = Map();
  int _lastRemovedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(child: Icon(Icons.list)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'My To-Do List',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('2 tarefas restantes'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: ListView(
                  children: [
                    /*
                    ListTile(
                        title: Text('teste'),
                        leading: Icon(Icons.h_mobiledata),
                        trailing: Checkbox(
                          onChanged: (value) => {},
                          value: false,
                        )),
                        */
                    TaskItem(),
                    TaskItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet()),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
