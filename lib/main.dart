import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'package:todo_list_cal/screens/calender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.robotoSerifTextTheme(),
          primaryColor: Colors.green,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(118, 7, 162, 0.522),
                Color.fromARGB(134, 62, 0, 161),
              ],
            ),
          ),
        ),
        title: const Text('Task Calender'),
      ),
      body: const CalenderScreen(),
    );
  }
}
