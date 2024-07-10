import 'package:flutter/material.dart';

class CompletedTaskTile extends StatelessWidget {
  const CompletedTaskTile({
    super.key,
    required this.completedTaskTitle,
    required this.completedTaskDescription,
    required this.isDone,
    required this.onChanged,
  });
  final String completedTaskTitle;
  final String completedTaskDescription;
  final bool isDone;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 85, 33, 140),
      child: ListTile(
        title: Text(
          completedTaskTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        trailing: Checkbox(
          fillColor: WidgetStateProperty.resolveWith((state) {
            return Colors.green;
          }),
          checkColor: Colors.black,
          value: isDone,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
