import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService{
  final FirebaseFirestore _firestoreInstance;

  UserService(this._firestoreInstance);

  Future<DocumentReference> saveUser({userDetails: AsiriUser}) {
    return _firestoreInstance.collection("mobile_app_users")
        .add(userDetails.toJson());
  }

  /// Function to save diary data
  /// this includes, notes, weight & temperature etc
  Future<DocumentReference> saveDiaryData(DiaryData diaryData) {
    return _firestoreInstance.collection("diary_data")
        .add(diaryData.toJson());
  }
}

class AsiriUser{
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

  DiaryData(this.type, this.data);

  Map<String, dynamic> toJson() => {
    'type' : type,
    'data' : data
  };
}

class Note {
  final String title;
  final String description;
  final String date;
  final List<String> imageUrls;

  Note(this.title, this.description, this.date, this.imageUrls);

  Map<String, dynamic> toJson() => {
    'title' : title,
    'description': description,
    'date': date.toString(),
    'imageUrls': imageUrls.toList(),
  };
}