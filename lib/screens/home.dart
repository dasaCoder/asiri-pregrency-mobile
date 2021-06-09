import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/screens/diary.dart';
import 'package:mother_and_baby/screens/reminders/addReminders.dart';
import 'package:mother_and_baby/screens/landingPage.dart';
import 'package:mother_and_baby/screens/reminders/reminders.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;

  const HomeScreen({Key key, this.selectedIndex = -1}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  AsiriUser asiriUser;
  ///
  int currentMonth = 1;
  @override
  Future<void> initState() {
    _selectedIndex = widget.selectedIndex > 0 ? widget.selectedIndex : 0;

    final firebaseUser = Provider.of<User>(context, listen: false);
    if (firebaseUser == null) {
      // TODO - handle error
    }
    Provider.of<UserService>(context, listen: false).getUser(firebaseUser.uid).then((userData) {
      setState(() {
        asiriUser = userData;
        currentMonth = calculateCurrentMonth(DateTime.fromMillisecondsSinceEpoch(asiriUser.dueDate));
      });
    });
  }

  int calculateCurrentMonth(DateTime startDate) {
    print(startDate);
    DateTime today = DateTime.now();
    int dateCount = today.difference(startDate).inDays;
    print("date count ${dateCount.toString()}");
    return (dateCount~/30)+1;
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      DiaryScreen(),
      LandingPage(asiriUser: asiriUser, currentMonth: currentMonth,),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];

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
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/bottomDrawer/group.png")),
            label: 'Community',
          ),
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
