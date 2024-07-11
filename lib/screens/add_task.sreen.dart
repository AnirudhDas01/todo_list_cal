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

    // ignore: no_leading_underscores_for_local_identifiers

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(101, 104, 58, 183),
              Color.fromARGB(59, 33, 149, 243)
            ],
          ),
        ),
        width: pageWidth,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 15),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
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
      ),
    );
  }
}
