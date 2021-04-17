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

}