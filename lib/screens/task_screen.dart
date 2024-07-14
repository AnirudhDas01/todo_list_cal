import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'package:todo_list_cal/screens/add_task.sreen.dart';
import 'package:todo_list_cal/widgets/completeted_task_list.dart';
import 'package:todo_list_cal/widgets/incomplete_task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.currentDate});

  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .clearCompletedTasks();
            },
            child: const Icon(
              Icons.delete,
              color: Color.fromARGB(180, 243, 72, 72),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(118, 7, 162, 0.522),
                Color.fromARGB(134, 62, 0, 161),
              ],
            ),
          ),
        ),
        leading: TextButton(
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${currentDate.day} ${DateFormat('EEEE').format(currentDate)}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(50, 255, 32, 77),
              Color.fromARGB(50, 3, 201, 135),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(9),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'Incomplete Task',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Expanded(child: IncompleteTaskList()),
                      Text(
                        'Complete Task',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Expanded(child: CompletedTaskList())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        label: const Text(
          'Create Task',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
