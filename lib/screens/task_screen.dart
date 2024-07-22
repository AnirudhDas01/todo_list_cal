import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'package:todo_list_cal/screens/add_task.sreen.dart';
import 'package:todo_list_cal/widgets/completeted_task_list.dart';
import 'package:todo_list_cal/widgets/incomplete_task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, required this.currentDate});

  final DateTime currentDate;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topLeft, end: Alignment.topRight),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topRight, end: Alignment.bottomRight),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomRight, end: Alignment.bottomLeft),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomLeft, end: Alignment.topLeft),
            weight: 1)
      ],
    ).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomRight, end: Alignment.bottomLeft),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomLeft, end: Alignment.topLeft),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topLeft, end: Alignment.topRight),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topRight, end: Alignment.bottomRight),
            weight: 1)
      ],
    ).animate(_controller);
    _controller.repeat();
  }

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
                Color.fromRGBO(118, 7, 162, 0.579),
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
          '${widget.currentDate.day} ${DateFormat('EEEE').format(widget.currentDate)}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: _topAlignmentAnimation.value,
                  end: _bottomAlignmentAnimation.value,
                  colors: const [
                    Color(0xFF994ECC),
                    Color(0xFF3E187A),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Expanded(child: IncompleteTaskList()),
                            Text(
                              'Complete Task',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Expanded(child: CompletedTaskList())
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
