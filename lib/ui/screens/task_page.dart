import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:to_do_app/model/task_data.dart';
import 'package:to_do_app/services/data_storage.dart';
import 'package:to_do_app/ui/widgets/add_task_bottom_sheet.dart';
import 'package:to_do_app/ui/widgets/task_list.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  final DataStorage dataStorage;

  const TaskPage({Key? key, required this.dataStorage}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  //List<Task> _todoList = [];
  Map<String, dynamic> _lastRemoved = Map();
  int _lastRemovedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.dataStorage.readData().then((String data) {
      setState(() {
        Provider.of<TaskData>(context).setList(jsonDecode(data));
      });
    });
    /*
    DataStorage().readData().then((data) {
      print('entrou aki!!');
      Provider.of<TaskData>(context).setList(json.decode(data));
    });
    */
  }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My To-Do',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${Provider.of<TaskData>(context).taskCount} Tarefas',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.list,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Container(
                  child: TaskList(),
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
