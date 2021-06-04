import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/reminders/addDoctorReminder.dart';
import 'package:mother_and_baby/screens/reminders/addVaccineReminder.dart';
import 'package:mother_and_baby/screens/reminders/reminderStreamBuilder.dart';
import 'package:mother_and_baby/services/notificationHelper.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';
import 'package:provider/provider.dart';

import 'addReminders.dart';

class ReminderScreen extends StatefulWidget {
  final ReminderType reminderType;

  const ReminderScreen({Key key, this.reminderType}) : super(key: key);
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  loadReminders() {
    getAllNotifications().then((value) => print(value.length));
  }

  deleteReminder(BuildContext context, DocumentSnapshot doc) {
    // loadReminders();
    for (int id in doc["reminderIds"]) {
      deleteNotification(id);
    }
    loadReminders();
    Provider.of<UserService>(context, listen: false).deleteReminder(doc.id);
    // cancelAllNotifications();
  }

  String getTitle() {
    if (widget.reminderType == ReminderType.MEDICINE)
      return "Medicine Reminder";
    else if (widget.reminderType == ReminderType.DOCTOR)
      return "Appointment Reminder";
    else if (widget.reminderType == ReminderType.VACCINE)
      return "Vaccine Reminder";
    else
      return "Other Reminder";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: () {
            if(widget.reminderType == ReminderType.MEDICINE) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddReminderScreen()));
            } else if(widget.reminderType == ReminderType.DOCTOR) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddDoctorReminder()));
            } else if(widget.reminderType == ReminderType.VACCINE) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddVaccineReminder()));
            } else {

            }

          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            size: 20.0,
          )),
      drawer: NavDrawer(),
      body: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: Builder(builder: (BuildContext context) {
          var mainContainerMargin =
              EdgeInsets.only(top: 10, left: 25, right: 25);
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Scaffold.of(context).openDrawer();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 30,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 25,
                            color: Color.fromRGBO(161, 129, 239, 1),
                          ),
                        ),
                      ),
                      Text(
                        getTitle(),
                        style: new TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(161, 129, 239, 1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: mainContainerMargin,
                  child:
                      ReminderStreamWidget(reminderType: widget.reminderType),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
