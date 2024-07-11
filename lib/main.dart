import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_cal/models/task_data.dart';
import 'screens/calender.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/LogoF.png',
            color: Colors.white,
            height: 300,
          ),
          nextScreen: const CalenderScreen(),
          duration: 3000,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: CalenderScreen(),
//     );
//   }
// }
