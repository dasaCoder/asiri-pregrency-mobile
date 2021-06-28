import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:rxdart/subjects.dart';

final BehaviorSubject<ReminderNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReminderNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

Future<void> initNotifications() async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/app_icon',
      [
        NotificationChannel(
            playSound: true,
            soundSource: 'resource://raw/alarm'
                '',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ]);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}

Future<void> showNotification() async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body'));
}

Future<void> scheduleNotificationPeriodically() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Notification at exactly every single minute',
          body:
              'This notification was schedule to repeat at every single minute at clock.',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/images/melted-clock.png'),
      schedule: NotificationCalendar(hour: 11, minute: 52));
}

Future<void> scheduleOneTimeNotification(int id, Reminder reminder) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: reminder.title,
          body: reminder.description,
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/images/schedule/msg.png'),
      schedule: NotificationCalendar(
          year: reminder.year,
          month: reminder.month,
          day: reminder.date,
          hour: reminder.startTimeHour,
          minute: reminder.startTimeMinute,
          second: 1,
          repeats: false));
}

Future<void> scheduleOnceDailyNotification(int id, Reminder reminder) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: reminder.title,
          body: reminder.description,
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/images/schedule/msg.png'),
      schedule: NotificationCalendar(
          hour: reminder.startTimeHour,
          minute: reminder.startTimeMinute,
          second: 1,
          repeats: true));
}

Future<void> scheduleTwiceDailyNotification(Reminder reminder) async {
  scheduleOnceDailyNotification(reminder.reminderIds[0], reminder);
  reminder.startTimeHour = reminder.startTimeHour + 12;
  scheduleOnceDailyNotification(reminder.reminderIds[1], reminder);
}

Future<void> scheduleTriceDailyNotification(Reminder reminder) async {
  scheduleOnceDailyNotification(reminder.reminderIds[0], reminder);
  reminder.startTimeHour = reminder.startTimeHour + 8;
  scheduleOnceDailyNotification(reminder.reminderIds[1], reminder);
  reminder.startTimeHour = reminder.startTimeHour + 8;
  scheduleOnceDailyNotification(reminder.reminderIds[2], reminder);
}

Future<List<PushNotification>> getAllNotifications() async {
  return AwesomeNotifications().listScheduledNotifications();
}

Future<void> deleteNotification(int id) {
  return AwesomeNotifications().cancel(id);
}

Future<void> cancelAllNotifications() {
  return AwesomeNotifications().cancelAll();
}

class ReminderNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReminderNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
