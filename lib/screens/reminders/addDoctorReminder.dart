import 'package:flutter/material.dart';
import 'package:mother_and_baby/services/notificationHelper.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'addReminders.dart';

class AddDoctorReminder extends StatefulWidget {
  @override
  _AddDoctorReminderState createState() => _AddDoctorReminderState();
}

class _AddDoctorReminderState extends State<AddDoctorReminder> {
  var nameController = TextEditingController();
  var medStrengthController = TextEditingController();
  var startTimeController = TextEditingController();
  var dateController = TextEditingController();
  TimeOfDay selectedTime;
  DateTime selectedDate;
  MedicineType selectedMedicineType = MedicineType.INJECTION;
  final _form = GlobalKey<FormState>();
  bool showProgressBar = false;

  saveReminder(BuildContext context) async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      showProgressBar = true;
    });

    Reminder reminder = Reminder(
        nameController.text,
        medStrengthController.text,
        selectedTime.hour,
        selectedTime.minute,
        "once",
        selectedMedicineType,
        ReminderType.DOCTOR,
        selectedDate.year,
        selectedDate.month,
        selectedDate.day);

    var idTmp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    var idList = [idTmp];
    reminder.reminderIds = idList;
    scheduleOneTimeNotification(reminder.reminderIds[0], reminder);

    Provider.of<UserService>(context, listen: false).saveReminder(reminder);

    setState(() {
      showProgressBar = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: Builder(
          builder: (BuildContext context) {
            var mainContainerMargin =
                EdgeInsets.only(top: 10, left: 25, right: 25);
            return SingleChildScrollView(
              child: Form(
                key: _form,
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
                            "Create Appointment Reminder",
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

                    /// Med name
                    Container(
                      child: Text(
                        "Name of the Doctor",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                      alignment: AlignmentDirectional.topStart,
                      margin: mainContainerMargin,
                    ),
                    Container(
                        margin: mainContainerMargin,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0,
                              color: Color.fromRGBO(60, 180, 242, 1)),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 25, right: 15),
                            child: TextFormField(
                                obscureText: false,
                                controller: nameController,
                                validator: (text) {
                                  if (text.isEmpty)
                                    return "Please enter a title";
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                )))),

                    /// Place
                    Container(
                      child: Text(
                        "Location",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                      alignment: AlignmentDirectional.topStart,
                      margin: mainContainerMargin,
                    ),
                    Container(
                        margin: mainContainerMargin,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0,
                              color: Color.fromRGBO(60, 180, 242, 1)),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 25, right: 15),
                            child: TextFormField(
                                obscureText: false,
                                validator: (text) {
                                  if (text.isEmpty)
                                    return "Please enter a valid value";
                                  else
                                    return null;
                                },
                                keyboardType: TextInputType.text,
                                controller: medStrengthController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                )))),

                    /// start date
                    Container(
                      child: Text(
                        "Appointment Date",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                      alignment: AlignmentDirectional.topStart,
                      margin: mainContainerMargin,
                    ),
                    Container(
                        margin: mainContainerMargin,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0,
                              color: Color.fromRGBO(60, 180, 242, 1)),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 25, right: 15),
                            child: TextFormField(
                                onTap: () async {
                                  selectedDate = await showDatePicker(
                                    initialDate: DateTime.now(),
                                    context: context,
                                    firstDate: DateTime(2021, 1),
                                    lastDate: DateTime(2030, 1),
                                  );
                                  dateController.text = DateFormat('yyyy-MM-dd')
                                      .format(selectedDate);
                                },
                                validator: (text) {
                                  if (text.isEmpty)
                                    return "Please enter a valid value";
                                  else
                                    return null;
                                },
                                obscureText: false,
                                controller: dateController,
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                )))),
                    SizedBox(
                      height: 10,
                    ),

                    /// start time
                    Container(
                      child: Text(
                        "Appointment Time",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                      alignment: AlignmentDirectional.topStart,
                      margin: mainContainerMargin,
                    ),
                    Container(
                        margin: mainContainerMargin,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0,
                              color: Color.fromRGBO(60, 180, 242, 1)),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 25, right: 15),
                            child: TextFormField(
                                onTap: () async {
                                  selectedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  startTimeController.text = selectedTime.hour
                                          .toString() +
                                      ":" +
                                      (selectedTime.minute < 10 ? "0" : "") +
                                      selectedTime.minute.toString();
                                },
                                validator: (text) {
                                  if (text.isEmpty)
                                    return "Please enter a valid value";
                                  else
                                    return null;
                                },
                                obscureText: false,
                                controller: startTimeController,
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                )))),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      margin: mainContainerMargin,
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
                          saveReminder(context);
                        },
                        child: showProgressBar
                            ? Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                      strokeWidth: 5,
                                    )))
                            : Container(
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
            );
          },
        ),
      ),
    );
  }
}
