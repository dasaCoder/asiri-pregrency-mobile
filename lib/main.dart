import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mother_and_baby/screens/welcome.dart';
import 'package:mother_and_baby/services/auth.service.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/NavDrawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'locale_constants.dart';
import 'localization_deligate.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mother_and_baby/services/notificationHelper.dart';

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initNotifications();

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        Provider<UserService>(
          create: (_) => UserService(FirebaseFirestore.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        locale: _locale,
        home: SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            body: Builder(
              builder: (context) => Container(
                child: WelcomeScreen(),
              ),
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
      ),
    );
  }
}
