import 'package:flutter/material.dart';

abstract class Languages {

  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  // month facts page
  String get monthFactsTitle;
  String get monthString;
  String get first;
  String get second;
  String get third;
  String get fourth;
  String get fifth;
  String get sixth;
  String get seventh;
  String get eighth;
  String get nine;

  // info menu page
  String get menuTitle;
  String get menuOption1;
  String get menuOption2;
  String get menuOption3;
  String get menuOption4;
  String get menuOption5;

  // specialist pages
  String get specialistTopic;
  String get specialistCaption1;
  String get specialistCaption2;
  String get specialistCaption3;
  String get specialistCaption4;
  String get specialistCaption5;

  // mid wife page
  String get midWifeTitle;
  String get midWifeCaption1;

  // exercise page
  String get exerciseTitle;
  String get exerciseCaption1;

  // drwer
  String get title;
  String get diary;
  String get reminders;
  String get community;
  String get consultant;
  String get midwife;
  String get exercise;
  String get hospital;
  String get medicineReminder;
  String get appoinmentsReminder;
  String get vaccineReminder;

  // diary
  String get diaryAddNote;
  String get diaryMedicine;
  String get diaryLifeStyle;
  String get diaryWeight;
  String get diaryTemperature;
  String get diaryWaterIntake;
  String get addWeightTitle;
  String get weightTxt;
  String get addNoteTitle;
  String get titleTxt;
  String get descriptionTxt;
  String get symptomsTxt;
}