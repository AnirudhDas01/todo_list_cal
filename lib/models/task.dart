class Task {
  Task({required this.title, required this.description, required this.isDone});
  String title;
  String description;
  bool isDone = false;

  void toggetDone() {
    isDone = !isDone;
  }
}
