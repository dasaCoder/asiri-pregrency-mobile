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