import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/screens/welcome.dart';
import 'package:mother_and_baby/services/auth.service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Scaffold.of(context).openDrawer();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                          color: Color.fromRGBO(161, 129, 239, 1),
                        ),
                      ),
                    ),
                    Text(
                      "Settings",
                      style: new TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(161, 129, 239, 1)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30, right: 40),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Logout"),
                      trailing: Icon(Icons.logout),
                      onTap: () => Provider.of<AuthenticationService>(context,
                              listen: false)
                          .signOut()
                          .then((value) => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        WelcomeScreen()))
                              }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
