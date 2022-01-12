class Task {
  final String name;
  DateTime? date;
  bool isComplete;

  Task({required this.name, this.isComplete = false, this.date});

  void changeTaskState() {
    isComplete = !isComplete;
  }
}
