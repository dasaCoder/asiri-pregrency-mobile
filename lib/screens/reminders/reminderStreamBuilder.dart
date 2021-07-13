import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/services/notificationHelper.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class ReminderStreamWidget extends StatelessWidget {
  final ReminderType reminderType;
  final String userId;

  const ReminderStreamWidget({
    Key key, this.reminderType, this.userId,
  }) : super(key: key);

  void removeReminder(BuildContext context, DocumentSnapshot ds) {
    for(int x=0; x< ds['reminderIds'].length; x++ ) {
      deleteNotification(ds['reminderIds'][x]);
    }
    Provider.of<UserService>(context, listen: false)
        .deleteReminder(ds.id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<UserService>(context)
            .getRemindersBuType(userId, reminderType),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          print(snapshot);
          if (!snapshot.hasData || snapshot.data.size == 0)
            return Container(
                width: MediaQuery.of(context).size.width*0.8,
                padding: EdgeInsets.all(10),
                color: Color.fromRGBO(255, 196, 196, 1.0),
                child: new Text(
                  "There is no reminders yet..",
                  style: TextStyle(fontSize: 18, color: Color.fromRGBO(
                      246, 47, 47, 1.0)),
                ));
          else {
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Column(
                    children: [
                      new ListTile(
                        leading: Image.asset(
                          "assets/images/drawer/pills.png",
                          height: 25,
                        ),
                        title: Text(ds['title']),
                        subtitle: Text(ds['description']),
                        trailing: InkWell(
                          child: Icon(Icons.delete_outline),
                          onTap: () {
                            removeReminder(context, ds);
                          },
                        ),
                        onTap: () => {},
                      ),
                      Divider()
                    ],
                  );
                });
          }
        });
  }
}