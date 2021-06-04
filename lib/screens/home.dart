import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/diary.dart';
import 'package:mother_and_baby/screens/reminders/addReminders.dart';
import 'package:mother_and_baby/screens/reminders/reminders.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;

  const HomeScreen({Key key, this.selectedIndex = -1}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex > 0 ? widget.selectedIndex : 0;
  }
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications_active_outlined),
          //   label: 'Reminders',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(246, 91, 122, 1.0),
        onTap: _onItemTapped,
      ),
      drawer: NavDrawer(),
      floatingActionButton:  _bottomButtons(),

      body: SingleChildScrollView(
        child: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }

  Widget _bottomButtons() {
    return _selectedIndex == 100
        ? FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddReminderScreen()));
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          size: 20.0,
        ))
        : null;
  }

}
