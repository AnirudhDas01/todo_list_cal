import 'package:flutter/material.dart';
import 'package:todo_list_cal/widgets/incomplete_task_tile.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'package:provider/provider.dart';

class IncompleteTaskList extends StatelessWidget {
  const IncompleteTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Card(
        color: const Color.fromARGB(161, 56, 91, 194),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return IncompleteTaskTile(
              taskTitle: taskData.tasks[index].title,
              taskDescription: taskData.tasks[index].description,
              isDone: taskData.tasks[index].isDone,
              onChanged: (value) {
                taskData.updateTask(
                  taskData.tasks[index],
                );
                Provider.of<TaskData>(context, listen: false)
                    .moveCheckedTaskToCompleted(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskLength,
        ),
      );
    });
  }
}
