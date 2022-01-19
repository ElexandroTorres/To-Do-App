import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/model/task.dart';

class DataStorage {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$localPath/data.json');
  }

  Future<String> readData() async {
    try {
      final file = await localFile;
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return e.toString();
    }
  }

  Future<File> saveData(List<Task> todoList) async {
    final file = await localFile;
    return file.writeAsString(json.encode(todoList));
  }

  /*
  Future<File> getFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.json');
  }

  Future<File> saveData(List<Task> todoList) async {
    String data = json.encode(todoList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    final File file = await getFile();
    return file.readAsString();
  }
  */
}
