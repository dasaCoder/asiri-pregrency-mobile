import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/Login.dart';
import 'package:mother_and_baby/screens/diary.dart';
import 'package:mother_and_baby/screens/home.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context, listen: false);
    var timer = Timer(Duration(seconds: 3), ()=> {
      if(firebaseUser == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginScreen()))
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()))
      }

    });

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(254, 226, 233, 1),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/welcome/clouds.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Image.asset(
                    "assets/images/welcome/baby.png",
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Image.asset(
                  "assets/images/welcome/caption.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              Image.asset(
                "assets/images/welcome/bg.png",
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
