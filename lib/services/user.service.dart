import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mother_and_baby/screens/reminders/addReminders.dart';

class UserService {
  final FirebaseFirestore _firestoreInstance;

  UserService(this._firestoreInstance);

  Future<DocumentReference> saveUser({userDetails: AsiriUser}) {
    return _firestoreInstance
        .collection("mobile_app_users")
        .add(userDetails.toJson());
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

class AsiriUser {
  final String userId;
  final String name;
  final String email;
  final String telephone;
  final String address;

  AsiriUser(this.userId, this.name, this.email, this.telephone, this.address);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'userId': userId,
        'telephone': telephone,
        'address': address
      };
}

class DiaryData {
  final String type;
  final dynamic data;
  String section = "LIFE_STYLE";
  String date;
  int createdAt;

  DiaryData(this.type, this.data);

  Map<String, dynamic> toJson() =>
      {'type': type, 'data': data, 'section': section, 'createdAt': createdAt, 'date': date};
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
