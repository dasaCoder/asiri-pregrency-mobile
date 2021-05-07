import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/main.dart';
import 'package:mother_and_baby/screens/infoMenu.dart';
import 'package:mother_and_baby/screens/monthsFactHome.dart';
import 'package:mother_and_baby/widgets/drawerItem.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return drawer(context);
  }

  Container drawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
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
          DrawerListItem(title: "Diary", imagePath: "diary.png",),
          DrawerListItem(title: "Reminders", imagePath: "bell.png",),
          DrawerListItem(title: "Community", imagePath: "community.png",),
          DrawerListItem(title: "Meet your consultant", imagePath: "consultant.png",),
          DrawerListItem(title: "Meet your midwife", imagePath: "nurse.png",),
          DrawerListItem(title: "Pregnancy Exercise", imagePath: "exercise.png",),
          DrawerListItem(title: "Hospital services", imagePath: "hospital.png",),
        ],
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
