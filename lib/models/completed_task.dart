class CompletedTask {
  CompletedTask(
      {required this.title, required this.description, required this.isDone});
  final String title;
  final String description;
  bool isDone;

  void toggetDone() {
    isDone = !isDone;
  }
}
