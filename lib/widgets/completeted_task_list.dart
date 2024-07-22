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
    void alertBox(TaskData taskData, int index) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Are you sure.?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Do you want to send Completed Task back to Incomplete Task.?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                taskData.updateCompletedTask(taskData.completedTask[index]);
                taskData.moveUncheckedTaskTOIncomplete(
                    taskData.completedTask[index]);
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Card(
          color: const Color.fromARGB(255, 92, 38, 180),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CompletedTaskTile(
                completedTaskTitle: taskData.completedTask[index].title,
                completedTaskDescription:
                    taskData.completedTask[index].description,
                isDone: taskData.completedTask[index].isDone,
                onChanged: (value) {
                  if (value == false) {
                    alertBox(taskData, index);
                  }
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
