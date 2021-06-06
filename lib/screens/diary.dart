import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';
import 'package:mother_and_baby/widgets/diary/addNoteDialog.dart';
import 'package:mother_and_baby/widgets/diary/addTemperatureDialog.dart';
import 'package:mother_and_baby/widgets/diary/addWaterIntake.dart';
import 'package:mother_and_baby/widgets/diary/addWeightDialog.dart';
import 'package:mother_and_baby/widgets/diary/diaryDataWidget.dart';
import 'package:mother_and_baby/widgets/diary/symptoms.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime firstDay = DateTime.parse("2021-01-01");
  DateTime lastDay = DateTime.parse("2025-01-01");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/diary/bg.png"),
              fit: BoxFit.cover)),
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
                 * Diary details for date
                 */
                DiaryDataWidget(),

                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(199, 233, 251, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListTile(
                    title: Text(
                      Languages.of(context).diaryAddNote,
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
                            return AddNoteAlertDialog(
                              selectedDate: dateFormatter.format(_selectedDay),
                            );
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
                      Languages.of(context).diaryMedicine,
                      style: new TextStyle(
                          color: Color.fromRGBO(70, 72, 162, 1), fontSize: 16),
                    ),
                    trailing: Image.asset(
                      "assets/images/diary/vitamins.png",
                      height: 40,
                    ),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(199, 233, 251, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ExpansionTile(
                    title: Text(
                      Languages.of(context).diaryLifeStyle,
                      style: new TextStyle(
                          color: Color.fromRGBO(70, 72, 162, 1), fontSize: 16),
                    ),
                    trailing: Image.asset(
                      "assets/images/diary/apple.png",
                      height: 40,
                    ),
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                            color: Color.fromRGBO(199, 233, 251, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.only(
                            left: 20, right: 0, top: 10, bottom: 0),
                        margin: EdgeInsets.only(left: 10, right: 0, top: 10),
                        child: ListTile(
                          title: Text(
                            Languages.of(context).diaryWeight,
                            style: new TextStyle(
                                color: Color.fromRGBO(70, 72, 162, 1),
                                fontSize: 15),
                          ),
                          trailing: Image.asset(
                            "assets/images/diary/weight.png",
                            height: 40,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddWeightDialog(
                                    selectedDate:
                                        dateFormatter.format(_selectedDay),
                                  );
                                });
                          },
                        ),
                      ),

                      /**
                       * Temperature
                       */
                      Container(
                        decoration: new BoxDecoration(
                            color: Color.fromRGBO(199, 233, 251, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.only(
                            left: 20, right: 10, top: 10, bottom: 0),
                        margin: EdgeInsets.only(left: 10, right: 0, top: 0),
                        child: ListTile(
                          title: Text(
                            Languages.of(context).diaryTemperature,
                            style: new TextStyle(
                                color: Color.fromRGBO(70, 72, 162, 1),
                                fontSize: 15),
                          ),
                          trailing: Image.asset(
                            "assets/images/diary/temperature.png",
                            height: 40,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddTemperatureDialog(
                                    selectedDate:
                                        dateFormatter.format(_selectedDay),
                                  );
                                });
                          },
                        ),
                      ),

                      /**
                       *  Water intake
                       */
                      Container(
                        decoration: new BoxDecoration(
                            color: Color.fromRGBO(199, 233, 251, 1),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        padding: EdgeInsets.only(
                            left: 20, right: 8, top: 10, bottom: 10),
                        margin: EdgeInsets.only(left: 10, right: 0, top: 0),
                        child: ListTile(
                          title: Text(
                            Languages.of(context).diaryWaterIntake,
                            style: new TextStyle(
                                color: Color.fromRGBO(70, 72, 162, 1),
                                fontSize: 15),
                          ),
                          trailing: Image.asset(
                            "assets/images/diary/water.png",
                            height: 40,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddWaterIntake(
                                    selectedDate:
                                        dateFormatter.format(_selectedDay),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SymptomsWidget(selectedDate: "${_selectedDay.year}-${_selectedDay.year}-${_selectedDay.year}",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

