import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle kCalendarBodyStyle = const CalendarStyle(
  defaultTextStyle: TextStyle(color: Colors.white),
  weekendTextStyle: TextStyle(color: Colors.white),
  selectedTextStyle: TextStyle(color: Colors.white),
  todayTextStyle: TextStyle(color: Colors.white),
  outsideTextStyle: TextStyle(color: Colors.white),
);

HeaderStyle kHeaderStyle = const HeaderStyle(
  titleTextStyle: TextStyle(color: Colors.white),
  formatButtonTextStyle: TextStyle(color: Colors.white),
  leftChevronIcon: Icon(
    Icons.chevron_left,
    color: Colors.white,
  ),
  rightChevronIcon: Icon(
    Icons.chevron_right,
    color: Colors.white,
  ),
  formatButtonVisible: false,
  titleCentered: true,
);

DaysOfWeekStyle kDaysOfWeekStyle = const DaysOfWeekStyle(
  weekdayStyle: TextStyle(
    color: Colors.white,
  ),
  weekendStyle: TextStyle(
    color: Colors.white,
  ),
);

InputDecoration inputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
  hintText: 'Title',
  focusColor: Colors.purple,
);

InputDecoration inputDecorationDescription = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
  hintText: 'Description',
  focusColor: Colors.purple,
);
