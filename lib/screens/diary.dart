import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';
import 'package:mother_and_baby/widgets/addNoteDialog.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime firstDay = DateTime.parse("2021-01-01");
  DateTime lastDay = DateTime.parse("2025-01-01");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context) => SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 30,
                          child: Image.asset(
                            "assets/images/drawer/burger.png",
                            height: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /**
                 * Calender
                 */
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: firstDay,
                  lastDay: lastDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                /**
                 * End calender
                 */
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(199, 233, 251, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListTile(
                    title: Text(
                      Languages.of(context).DiaryAddNote,
                      style: new TextStyle(
                          color: Color.fromRGBO(70, 72, 162, 1), fontSize: 16),
                    ),
                    trailing: Image.asset(
                      "assets/images/diary/note.png",
                      height: 40,
                    ),
                    onTap: () => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddNoteAlertDialog();
                          })
                    },
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(199, 233, 251, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListTile(
                    title: Text(
                      Languages.of(context).DiaryMedicine,
                      style: new TextStyle(
                          color: Color.fromRGBO(70, 72, 162, 1), fontSize: 16),
                    ),
                    trailing: Image.asset(
                      "assets/images/diary/vitamins.png",
                      height: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}