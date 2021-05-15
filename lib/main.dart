import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mother_and_baby/KickCounter.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/screens/diary.dart';
import 'package:mother_and_baby/screens/specialistPage.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';

import 'locale_constants.dart';
import 'localization_deligate.dart';

void main() {
  runApp(HomePage(
    title: "test title",
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyHomePageState>();
    state.setLocale(newLocale);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
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
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      locale: _locale,
      home: SafeArea(
        child: Scaffold(
          drawer: NavDrawer(),
          body: Builder(
            builder: (context) => Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
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
                    ]),
                  ),
                  Container(child: _widgetOptions.elementAt(_selectedIndex)),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      ),
      builder: (context, navigator) {
        var lang = Localizations.localeOf(context).languageCode;

        return Theme(
          data:
              ThemeData(fontFamily: lang == 'en' ? 'RocknRollOne' : 'FM_Malit'),
          child: SafeArea(child: navigator),
        );
      },
      supportedLocales: [
        Locale('en', ''),
        Locale('si', ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      },
    );
  }
}
