import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'package:todo_list_cal/styles.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    String newTaskTitle = '';
    String newTaskDescription = '';

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(101, 104, 58, 183),
              Color.fromARGB(59, 33, 149, 243)
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: pageWidth,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Add Task',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                autofocus: true,
                decoration: inputDecoration,
                style: const TextStyle(color: Colors.white),
                onChanged: (inputTask) {
                  newTaskTitle = inputTask;
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: inputDecorationDescription,
                onChanged: (inputTask) {
                  newTaskDescription = inputTask;
                },
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle, newTaskDescription, false);

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Task Added")),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(244, 139, 187, 241),
                ),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
