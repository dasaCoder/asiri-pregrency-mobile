import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/diary.dart';
import 'package:mother_and_baby/screens/reminders.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DiaryScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    ReminderScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type:  BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(161, 129, 239, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts_outlined),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/bottomDrawer/group.png")),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/bottomDrawer/heart.png")),
            label: 'Healths',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Reminders',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(246, 91, 122, 1.0),
        onTap: _onItemTapped,
      ),
      drawer: NavDrawer(),


      body: SingleChildScrollView(
        child: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
