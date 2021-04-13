import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mother_and_baby/KickCounter.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';

import 'locale_constants.dart';
import 'localization_deligate.dart';

void main() {
  runApp(HomePage(title: "test title",));
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      home: Scaffold(
        drawer: NavDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Languages.of(context).appName",
              ),
            ],
          ),
        ),
      ),
      builder: (context, navigator) {
        var lang = Localizations.localeOf(context).languageCode;

        return Theme(
          data: ThemeData(
              fontFamily: lang == 'en'? 'RocknRollOne' : ''
          ),
          child: navigator,
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
