import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/main.dart';
import 'package:mother_and_baby/screens/infoMenu.dart';
import 'package:mother_and_baby/screens/monthsFactHome.dart';
import 'package:mother_and_baby/widgets/drawerItem.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return drawer(context);
  }

  bool selected = false;

  toggleRemindersOptions() {
    setState(() {
      selected = !selected;
    });
  }

  SingleChildScrollView drawer(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: new BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: new BoxDecoration(color: Color.fromRGBO(242,236,255,1)),
        child: Column(
          children: [
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
                      color: Color.fromRGBO(161,129,239,1)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset(
                "assets/images/drawer/avatar.png",
                height: 150,
                width: 150,
              ),
            ),
            DrawerListItem(title: Languages.of(context).diary, imagePath: "diary.png",),
            DrawerListItem(title: Languages.of(context).reminders, imagePath: "bell.png", onClicked: toggleRemindersOptions,),
            AnimatedContainer(
              height: selected ? 150.0 : 0.0,
              color: selected ? Color.fromRGBO(231,219,255,1) : Color.fromRGBO(242,236,255,1),
              alignment: AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.only(left: 30.0, right: 20, top: 10),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(children: [
                    DrawerListItem(title: Languages.of(context).medicineReminder, imagePath: "pills.png",),
                    DrawerListItem(title: Languages.of(context).appoinmentsReminder, imagePath: "tie.png",),
                    DrawerListItem(title: Languages.of(context).vaccineReminder, imagePath: "vaccine.png",),
                  ],),
                ],
              ),
            ),
            DrawerListItem(title: Languages.of(context).community, imagePath: "community.png",),
            DrawerListItem(title: Languages.of(context).consultant, imagePath: "consultant.png",),
            DrawerListItem(title: Languages.of(context).midwife, imagePath: "nurse.png",),
            DrawerListItem(title: Languages.of(context).exercise, imagePath: "exercise.png",),
            DrawerListItem(title: Languages.of(context).hospital, imagePath: "hospital.png",),
          ],
        ),
      ),
    );
  }

  Drawer oldDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/drawer/avatar.png'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(
                        title: "test title",
                      )));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => InfoMenu()));
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Months facts'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MonthsFactsHome()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
