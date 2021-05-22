import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/diary.dart';
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
        backgroundColor: Color.fromRGBO(161, 129, 239, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/bottomDrawer/diary.png")),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/bottomDrawer/group.png")),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/bottomDrawer/heart.png")),
            label: 'Health',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(120, 102, 221, 1),
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
