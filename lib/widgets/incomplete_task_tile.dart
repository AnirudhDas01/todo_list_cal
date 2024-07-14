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
      color: const Color(0xffFF204E),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
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
                color: Colors.white54,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder : (context) =>TaskDetailScreen(taskTitle: taskTitle, taskDescription: taskDescription)));
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
          children: [
            ListTile(
              title: Text(
                taskDescription,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
