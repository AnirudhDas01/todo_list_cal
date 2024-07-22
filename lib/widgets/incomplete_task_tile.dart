import 'package:flutter/material.dart';
import 'package:todo_list_cal/screens/task_detail_screen.dart';

class IncompleteTaskTile extends StatelessWidget {
  const IncompleteTaskTile({
    super.key,
    required this.taskTitle,
    required this.isDone,
    required this.taskDescription,
    required this.onChanged,
  });

  final String taskTitle;
  final String taskDescription;
  final bool isDone;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(101, 145, 57, 147),
              Color.fromARGB(136, 84, 80, 216),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.timer_outlined,
                color: Colors.yellow,
                size: 16,
              ),
              const SizedBox(width: 8),
              Container(
                height: 16,
                width: 1,
                color: Colors.white38,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailScreen(
                          taskTitle: taskTitle,
                          taskDescription: taskDescription),
                    ),
                  );
                },
                child: Text(
                  taskTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          trailing: Checkbox(
            activeColor: const Color.fromARGB(185, 114, 225, 118),
            onChanged: onChanged,
            value: isDone,
          ),
        ),
      ),
    );
  }
}
