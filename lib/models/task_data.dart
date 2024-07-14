import 'package:flutter/foundation.dart';
import 'package:todo_list_cal/models/completed_task.dart';
import 'package:todo_list_cal/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        title: 'this is a title',
        description: 'This is a description',
        isDone: false)
  ];

  List<Task> get tasks => _tasks; // _a = a will be a private variable....

  final List<CompletedTask> _completedTask = [];

  List<CompletedTask> get completedTask => _completedTask;

  void clearCompletedTasks() {
    _completedTask.clear();

    notifyListeners();
  }

  int get completedTaskLength {
    return completedTask.length;
  }

  int get taskLength {
    return tasks.length;
  }

  void moveCheckedTaskToCompleted(Task task) {
    if (task.isDone) {
      _tasks.remove(task);
    }
    _completedTask.add(CompletedTask(
      title: task.title,
      description: task.description,
      isDone: task.isDone,
    ));
    notifyListeners();
  }

  void updateCompletedTask(CompletedTask completedTask) {
    completedTask.toggetDone();
    notifyListeners();
  }

  void moveUncheckedTaskTOIncomplete(CompletedTask completedTask) {
    if (completedTask.isDone == false) {
      _completedTask.remove(completedTask);
    }
    _tasks.add(
      Task(
        title: completedTask.title,
        description: completedTask.description,
        isDone: completedTask.isDone,
      ),
    );
    notifyListeners();
  }



  void updateTask(Task task) {
    task.toggetDone();

    notifyListeners();
  }

  void addTask(String newTasktitle, String newDescription, bool isDone) {
    //adds a new task
    Task task =
        Task(title: newTasktitle, description: newDescription, isDone: isDone);
    tasks.add(task);

    notifyListeners();
  }
}
