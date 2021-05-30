import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mother_and_baby/main.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:mother_and_baby/services/notificationHelper.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  var nameController = TextEditingController();

  saveReminder() async{
    var scheduledNotificationDateTime =
    new DateTime.now().add(new Duration(seconds: 20));
    // showNotification(flutterLocalNotificationsPlugin);
    scheduleNotification(flutterLocalNotificationsPlugin, "test noti", "123456",scheduledNotificationDateTime );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                      Text(
                        "Medicine Reminder",
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
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(60, 180, 242, 1)),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.only(bottom: 5),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/reminders/injection.png",
                                  height: 80,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Injection",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(60, 180, 242, 1)),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.only(bottom: 5),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/reminders/pills.png",
                                  height: 80,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Injection",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.0, color: Color.fromRGBO(60, 180, 242, 1)),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 15),
                        child: TextFormField(
                            obscureText: false,
                            controller: nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Name',
                              contentPadding:
                                  EdgeInsets.only(top: 5, bottom: 5),
                            )))),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  // decoration: BoxDecoration(color: Colors.red),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 87, 143, 1),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      saveReminder();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
