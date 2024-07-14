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

    bool validateInputs(String title, String description) {
      return title.isEmpty && description.isEmpty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task Screen'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(59, 104, 58, 183),
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
              const SizedBox(height: 30),
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
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  if (validateInputs(newTaskTitle, newTaskDescription)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Title or descrption is Empty"),
                      ),
                    );
                    return;
                  }

                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle, newTaskDescription, false);

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Task Added"),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.deepPurpleAccent,
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
