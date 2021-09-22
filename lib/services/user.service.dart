import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/models/communityPost.dart';
import 'package:mother_and_baby/models/message.dart';
import 'package:mother_and_baby/screens/reminders/addReminders.dart';

class UserService {
  final FirebaseFirestore _firestoreInstance;
  final DBNAME = "mobile_app_users";
  final COMMUNITY_DB = "community_post";
  final MESSAGE_DB = "messages";

  UserService(this._firestoreInstance);

  Future<DocumentReference> saveUser({userDetails: AsiriUser}) {
    return _firestoreInstance.collection(DBNAME).add(userDetails.toJson());
  }

  Future<void> incrementKickCount(String uuid) {
    return _firestoreInstance
        .collection(DBNAME)
        .where("userId", isEqualTo: uuid)
        .limit(1)
        .get()
        .then((snapshot) {
      _firestoreInstance
          .collection(DBNAME)
          .doc(snapshot.docs.first.id)
          .set({"kickCount": FieldValue.increment(1)}, SetOptions(merge: true));
    });
  }

  Future<AsiriUser> getUser(String uuid) async {
    // ignore: non_constant_identifier_names
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestoreInstance
          .collection(DBNAME)
          .where("userId", isEqualTo: uuid)
          .limit(1)
          .get();
      if(snapshot.docs.length < 1) {
        return null;
      }
      var user = snapshot.docs.first.data();
      AsiriUser asiriUser = AsiriUser.fromJson(user);
      return asiriUser;
    } on Exception catch (e) {
      print(e);
      return null;
    }
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
    print("user is " + diaryData.userId);
    diaryData.date = diaryData.data['date'];
    return _firestoreInstance.collection("diary_data").add(diaryData.toJson());
  }

  Stream<QuerySnapshot<dynamic>> getDiaryData(String uuid, String date) {
    print("date"+date);
    DateTime now = DateTime.now();
    var beginningDate = DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
    print(beginningDate);
    return _firestoreInstance
        .collection("diary_data")
        .where("userId", isEqualTo: uuid)
        .where("date",isEqualTo: date)
        // .where("createdAt", isGreaterThanOrEqualTo: beginningDate)
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

  /// Function to retrieve reminders on given type
  Stream<QuerySnapshot<dynamic>> getRemindersBuType(String userId, ReminderType reminderType) {
    return _firestoreInstance
        .collection("reminder_data")
        .where("userId", isEqualTo: userId)
        .where("reminderType", isEqualTo: reminderType.toString())
        .snapshots();
  }

  /// Save community post
  Future<void> saveCommunityPost(CommunityPost communityPost) {
    return _firestoreInstance
        .collection(COMMUNITY_DB)
        .add(communityPost.toJson());
  }

  Future<void> likePost(String docId, String userId) {
    return _firestoreInstance.collection(COMMUNITY_DB).doc(docId).set({
      "likedUserIdList": FieldValue.arrayUnion([userId])
    }, SetOptions(merge: true));
  }

  Future<void> unlikePost(String docId, String userId) {
    return _firestoreInstance.collection(COMMUNITY_DB).doc(docId).set({
      "likedUserIdList": FieldValue.arrayRemove([userId])
    }, SetOptions(merge: true));
  }

  Stream<QuerySnapshot<dynamic>> getCommunityPosts(int limit) {
    return _firestoreInstance.collection(COMMUNITY_DB).orderBy("createdAt", descending: true).limit(limit).snapshots();
  }

  /// Save message
  Future<void> saveMessage(Message message) {
    return _firestoreInstance
        .collection(MESSAGE_DB)
        .add(message.toJson());
  }

  Stream<QuerySnapshot<dynamic>> getMessages() {
    return _firestoreInstance.collection(MESSAGE_DB)
        .orderBy("createdAt")
        .limit(100).snapshots();
  }
}

class DiaryData {
  final String type;
  final dynamic data;
  String userId;
  String section = "LIFE_STYLE";
  String date;
  int createdAt;

  DiaryData(this.type, this.data);

  Map<String, dynamic> toJson() => {
        'type': type,
        'data': data,
        'section': section,
        'createdAt': createdAt,
        'date': date,
        'userId': userId
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
  final String userId;
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
      this.date, this.userId);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'startTimeHour': startTimeHour,
        'startTimeMinute': startTimeMinute,
        'frequency': frequency,
        'reminderIds': reminderIds.toList(),
        'medicineType': medicineType.toString(),
        'userId': userId,
        'reminderType': reminderType.toString()
      };
}
