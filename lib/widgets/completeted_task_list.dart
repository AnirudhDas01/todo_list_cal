import 'package:flutter/material.dart';
import 'completed_task_tile.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'package:provider/provider.dart';

class CompletedTaskList extends StatelessWidget {
  const CompletedTaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Card(
          color: const Color.fromARGB(182, 85, 33, 140),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CompletedTaskTile(
                completedTaskTitle: taskData.completedTask[index].title,
                completedTaskDescription:
                    taskData.completedTask[index].description,
                isDone: taskData.completedTask[index].isDone,
                onChanged: (value) {
                  taskData.updateCompletedTask(taskData.completedTask[index]);
                  taskData.moveUncheckedTaskTOIncomplete(
                      taskData.completedTask[index]);
                },
              );
            },
            itemCount: taskData.completedTaskLength,
          ),
        );
      },
    );
  }
}
