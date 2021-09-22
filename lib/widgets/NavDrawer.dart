import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/main.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/screens/diary.dart';
import 'package:mother_and_baby/screens/home.dart';
import 'package:mother_and_baby/screens/kickCounter.dart';
import 'package:mother_and_baby/screens/midWifePage.dart';
import 'package:mother_and_baby/screens/excersicePage.dart';
import 'package:mother_and_baby/screens/reminders/reminders.dart';
import 'package:mother_and_baby/screens/servicesInfo.dart';
import 'package:mother_and_baby/screens/settings.dart';
import 'package:mother_and_baby/screens/specialistPage.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/drawerItem.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  AsiriUser asiriUser;


  @override
  Widget build(BuildContext context) {
    String uuid = Provider.of<User>(context).uid;
    Provider.of<UserService>(context).getUser(uuid).then((value) => asiriUser = value);

    return oldDrawer(context);
  }

  bool selected = false;

  toggleRemindersOptions() {
    setState(() {
      selected = !selected;
    });
  }

  navigateToPage(BuildContext context, String pageName) {
    print("navigate to page");
    Navigator.of(context).pop();
    switch (pageName) {
      case "DIARY":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(
                    selectedIndex: 0,
                  )));
        }
        break;
      case "COMMUNITY":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(
                    selectedIndex: 2,
                  )));
        }
        break;
      case "MEDICINE_REMINDER":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ReminderScreen(
                    reminderType: ReminderType.MEDICINE,
                  )));
        }
        break;
      case "DOCTOR_REMINDER":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ReminderScreen(
                    reminderType: ReminderType.DOCTOR,
                  )));
        }
        break;
      case "VACCINE_REMINDER":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ReminderScreen(
                    reminderType: ReminderType.VACCINE,
                  )));
        }
        break;
      case "SPECIALIST_PAGE":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => SpecialistPage()));
        }
        break;
      case "MIDWIFE_PAGE":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MidWifePage()));
        }
        break;
      case "EXERCISE_AGE":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ExercisePage()));
        }
        break;
      case "CONTACT_US":
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ServicesInfo()));
        }
        break;
      case "KICK_COUNTER": {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => KickCounter(
              asiriUser: asiriUser,
            )));
      }
      break;
      default:
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DiaryScreen()));
        }
    }
  }

  Container oldDrawer(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(242, 236, 255,
              1), //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 30,
                        child: Image.asset(
                          "assets/images/drawer/burger.png",
                          height: 15,
                        ),
                      ),
                    ),
                    Text(
                      "Menu",
                      style: new TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(161, 129, 239, 1)),
                    ),
                  ],
                ),
              ),
              asiriUser != null ? Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: asiriUser.imageUrl == "" ? Image.asset(
                      "assets/images/drawer/avatar.png",
                      height: 150,
                      width: 150,
                    ) : Image.network(asiriUser.imageUrl, height: 150, width: 150,),
                  ),
                  Positioned(
                    right: 50,
                    bottom: 0,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SettingsScreen()));
                      },
                    ),
                  )
                ],
              ) : SizedBox(child: Center(child: CircularProgressIndicator()), height: 150,),

              DrawerListItem(
                title: Languages.of(context).diary,
                imagePath: "diary.png",
                onClicked: () => navigateToPage(context, "DIARY"),
              ),
              // DrawerListItem(title: Languages.of(context).reminders, imagePath: "bell.png", onClicked: toggleRemindersOptions,),
              ExpansionTile(
                leading: Image.asset(
                  "assets/images/drawer/bell.png",
                  height: 25,
                ),
                title: Text(Languages.of(context).reminders),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        DrawerListItem(
                          title: Languages.of(context).medicineReminder,
                          imagePath: "pills.png",
                          onClicked: () =>
                              navigateToPage(context, "MEDICINE_REMINDER"),
                        ),
                        DrawerListItem(
                          title: Languages.of(context).appoinmentsReminder,
                          imagePath: "tie.png",
                          onClicked: () =>
                              navigateToPage(context, "DOCTOR_REMINDER"),
                        ),
                        DrawerListItem(
                          title: Languages.of(context).vaccineReminder,
                          imagePath: "vaccine.png",
                          onClicked: () =>
                              navigateToPage(context, "VACCINE_REMINDER"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              DrawerListItem(
                title: "Kick Counter",
                imagePath: "consultant.png",
                onClicked: () => navigateToPage(context, "KICK_COUNTER"),
              ),
              DrawerListItem(
                title: Languages.of(context).community,
                imagePath: "community.png",
                onClicked: () => navigateToPage(context, "COMMUNITY"),
              ),
              DrawerListItem(
                title: Languages.of(context).consultant,
                imagePath: "consultant.png",
                onClicked: () => navigateToPage(context, "SPECIALIST_PAGE"),
              ),
              DrawerListItem(
                title: Languages.of(context).midwife,
                imagePath: "nurse.png",
                onClicked: () => navigateToPage(context, "MIDWIFE_PAGE"),
              ),
              DrawerListItem(
                title: Languages.of(context).exercise,
                imagePath: "exercise.png",
                onClicked: () => navigateToPage(context, "EXERCISE_AGE"),
              ),
              DrawerListItem(
                title: Languages.of(context).hospital,
                imagePath: "hospital.png",
                onClicked: () => navigateToPage(context, "CONTACT_US"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
