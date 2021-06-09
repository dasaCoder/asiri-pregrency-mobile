import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/screens/reminders/addReminders.dart';

class UserService {
  final FirebaseFirestore _firestoreInstance;

  UserService(this._firestoreInstance);

  Future<DocumentReference> saveUser({userDetails: AsiriUser}) {
    return _firestoreInstance
        .collection("mobile_app_users")
        .add(userDetails.toJson());
  }

  Future<AsiriUser> getUser(String uuid) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestoreInstance
        .collection("mobile_app_users")
        .where("userId", isEqualTo: uuid)
        .limit(1)
        .get();
    var user = snapshot.docs.first.data();
    AsiriUser asiriUser = AsiriUser.fromJson(user);
    return asiriUser;
  }

  DateTime calculateAndSaveDueDate(
      String uuid, String method, DateTime selectedDate) {
    DateTime dueDate = calculateDueDate(method, selectedDate);
    _firestoreInstance
        .collection("mobile_app_users")
        .where("userId", isEqualTo: uuid)
        .limit(1)
        .get()
        .then((snapshots) {
      _firestoreInstance
          .collection("mobile_app_users")
          .doc(snapshots.docs.first.id)
          .set({
        "pregnantStartDate": selectedDate.millisecondsSinceEpoch,
        "dueDate": dueDate.millisecondsSinceEpoch,
        "calculatedMethod": method
      }, SetOptions(merge: true));
    });
    return dueDate;
  }

  /// Function to calculate due date
  /// source : https://www.whattoexpect.com/due-date-calculator/
  DateTime calculateDueDate(String method, DateTime startDate) {
    var optionsList = <String>[
      'First day of last period',
      'Conception date',
      'IVF transfer date'
    ];

    DateTime dueDate;
    if (method == optionsList[0]) {
      dueDate = startDate.add(Duration(days: 280));
    } else if (method == optionsList[1]) {
      dueDate = startDate.add(Duration(days: 266));
    } else if (method == optionsList[2]) {
      dueDate = startDate.add(Duration(days: 266));
    }

    return dueDate;
  }

  /// Function to save diary data
  /// this includes, notes, weight & temperature etc
  Future<DocumentReference> saveDiaryData(DiaryData diaryData) {
    diaryData.createdAt = DateTime.now().millisecondsSinceEpoch;
    diaryData.date = diaryData.data['date'];
    return _firestoreInstance.collection("diary_data").add(diaryData.toJson());
  }

  Stream<QuerySnapshot<dynamic>> getDiaryData() {
    return _firestoreInstance
        .collection("diary_data")
        // .where("section", isEqualTo: "LIFE_STYLE")
        .orderBy("createdAt")
        .snapshots();
  }

  /// Function to save reminders
  Future<DocumentReference> saveReminder(Reminder reminderData) {
    return _firestoreInstance
        .collection("reminder_data")
        .add(reminderData.toJson());
  }

  /// Function to remove reminders
  Future<void> deleteReminder(String id) {
    return _firestoreInstance.collection("reminder_data").doc(id).delete();
  }

  /// Function to retrieve all reminders
  Stream<QuerySnapshot<dynamic>> getReminders() {
    return _firestoreInstance.collection("reminder_data").snapshots();
  }

  /// Function to retrive reminders on given type
  Stream<QuerySnapshot<dynamic>> getRemindersBuType(ReminderType reminderType) {
    return _firestoreInstance
        .collection("reminder_data")
        .where("reminderType", isEqualTo: reminderType.toString())
        .snapshots();
  }
}

class DiaryData {
  final String type;
  final dynamic data;
  String section = "LIFE_STYLE";
  String date;
  int createdAt;

  DiaryData(this.type, this.data);

  Map<String, dynamic> toJson() => {
        'type': type,
        'data': data,
        'section': section,
        'createdAt': createdAt,
        'date': date
      };
}

class Note {
  final String title;
  final String description;
  final String date;
  final List<String> imageUrls;

  Note(this.title, this.description, this.date, this.imageUrls);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'date': date.toString(),
        'imageUrls': imageUrls.toList(),
      };
}

enum ReminderType { MEDICINE, DOCTOR, VACCINE }

class Reminder {
  final String title;
  final String description;
  final String frequency;
  List<int> reminderIds;
  final MedicineType medicineType;
  final ReminderType reminderType;
  int startTimeHour;
  int startTimeMinute;
  int year;
  int month;
  int date;

  Reminder(
      this.title,
      this.description,
      this.startTimeHour,
      this.startTimeMinute,
      this.frequency,
      this.medicineType,
      this.reminderType,
      this.year,
      this.month,
      this.date);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'startTimeHour': startTimeHour,
        'startTimeMinute': startTimeMinute,
        'frequency': frequency,
        'reminderIds': reminderIds.toList(),
        'medicineType': medicineType.toString(),
        'reminderType': reminderType.toString()
      };
}
