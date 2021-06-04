import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mother_and_baby/main.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:mother_and_baby/services/notificationHelper.dart';

enum MedicineType { INJECTION, PILLS, INHALER, DROPS, OTHER }

class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  var nameController = TextEditingController();
  var medStrengthController = TextEditingController();
  var startTimeController = TextEditingController();
  TimeOfDay selectedTime;
  MedicineType selectedMedicineType = MedicineType.INJECTION;
  var medIntakeFrequency = "Once daily";
  final _form = GlobalKey<FormState>();
  bool showProgressBar = false;

  setReminderType(MedicineType reminderType) {
    setState(() {
      selectedMedicineType = reminderType;
    });
  }

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
        medIntakeFrequency,
        selectedMedicineType,
        ReminderType.MEDICINE, 0,0,0);

    var idTmp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (medIntakeFrequency.contains("Once daily")) {
      var idList = [idTmp];
      reminder.reminderIds = idList;
      scheduleOnceDailyNotification(reminder.reminderIds[0], reminder);
    } else if (medIntakeFrequency.contains("Twice daily")) {
      var idList = [idTmp, (idTmp + 1)];
      reminder.reminderIds = idList;
      scheduleTwiceDailyNotification(reminder);
    } else {}

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
                            "Add Medicine Reminder",
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
                        "Med name",
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

                    /// Med type
                    Container(
                      child: Text(
                        "Med type",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () =>
                                  setReminderType(MedicineType.INJECTION),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(60, 180, 242, 1)),
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color: selectedMedicineType ==
                                          MedicineType.INJECTION
                                      ? Color.fromRGBO(60, 180, 242, 1)
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.all(2),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/reminders/injection.png",
                                        height: 30,
                                        color: selectedMedicineType ==
                                                MedicineType.INJECTION
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                      Text(
                                        "Injection",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selectedMedicineType ==
                                                  MedicineType.INJECTION
                                              ? Colors.white
                                              : Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () => setReminderType(MedicineType.PILLS),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(60, 180, 242, 1)),
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color:
                                      selectedMedicineType == MedicineType.PILLS
                                          ? Color.fromRGBO(60, 180, 242, 1)
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.all(2),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        padding: EdgeInsets.all(2),
                                        child: Image.asset(
                                          "assets/images/reminders/pills.png",
                                          height: 20,
                                          color: selectedMedicineType ==
                                                  MedicineType.PILLS
                                              ? Colors.white
                                              : Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        "Pills",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selectedMedicineType ==
                                                  MedicineType.PILLS
                                              ? Colors.white
                                              : Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () =>
                                  setReminderType(MedicineType.INHALER),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(60, 180, 242, 1)),
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color: selectedMedicineType ==
                                          MedicineType.INHALER
                                      ? Color.fromRGBO(60, 180, 242, 1)
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.all(2),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/reminders/injection.png",
                                        height: 30,
                                        color: selectedMedicineType ==
                                                MedicineType.INHALER
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                      Text(
                                        "Inhaler",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selectedMedicineType ==
                                                  MedicineType.INHALER
                                              ? Colors.white
                                              : Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () => setReminderType(MedicineType.DROPS),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(60, 180, 242, 1)),
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color:
                                      selectedMedicineType == MedicineType.DROPS
                                          ? Color.fromRGBO(60, 180, 242, 1)
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.all(2),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/reminders/injection.png",
                                        height: 30,
                                        color: selectedMedicineType ==
                                                MedicineType.DROPS
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                      Text(
                                        "Drops",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selectedMedicineType ==
                                                  MedicineType.DROPS
                                              ? Colors.white
                                              : Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () => setReminderType(MedicineType.OTHER),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(60, 180, 242, 1)),
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color:
                                      selectedMedicineType == MedicineType.OTHER
                                          ? Color.fromRGBO(60, 180, 242, 1)
                                          : Colors.white,
                                ),
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.all(2),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/reminders/injection.png",
                                        height: 30,
                                        color: selectedMedicineType ==
                                                MedicineType.OTHER
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                      Text(
                                        "Other",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selectedMedicineType ==
                                                  MedicineType.OTHER
                                              ? Colors.white
                                              : Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Frequency drop down
                    Container(
                      child: Text(
                        "Frequency of the med intake",
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
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25, right: 15),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: medIntakeFrequency,
                            // icon: const Icon(Icons.arrow_downward),
                            // iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            onChanged: (String newValue) {
                              setState(() {
                                medIntakeFrequency = newValue;
                              });
                            },
                            items: <String>[
                              'Once daily',
                              'Twice daily',
                              '3 times a day'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),

                    /// Med strength
                    Container(
                      child: Text(
                        "Med strength",
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
                                keyboardType: TextInputType.number,
                                controller: medStrengthController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                )))),

                    /// start time
                    Container(
                      child: Text(
                        "Intake start time",
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
                                  startTimeController.text =
                                      selectedTime.hour.toString() +
                                          ":" +
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
