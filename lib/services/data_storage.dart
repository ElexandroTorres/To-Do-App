import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/model/task.dart';

class DataStorage {
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.json');
  }

  Future<File> saveData(List<Task> todoList) async {
    String data = json.encode(todoList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    final file = await getFile();
    return file.readAsString();
  }
}
