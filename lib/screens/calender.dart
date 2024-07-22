import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'task_screen.dart';
import 'package:todo_list_cal/styles.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat calenderFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(10),
            //   bottomRight: Radius.circular(10),
            // ),
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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TableCalendar(
            firstDay: DateTime.utc(2001, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            availableGestures: AvailableGestures.horizontalSwipe,
            calendarFormat: calenderFormat,
            onFormatChanged: (format) {
              setState(() {
                calenderFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              focusedDay = _focusedDay;
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TaskScreen(
                      currentDate: selectedDay,
                    );
                  },
                ),
              );
            },
            calendarStyle: kCalendarBodyStyle,
            headerStyle: kHeaderStyle,
            daysOfWeekStyle: kDaysOfWeekStyle,
          ),
        ],
      ),
    );
  }
}
