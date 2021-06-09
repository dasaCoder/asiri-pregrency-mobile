import 'package:flutter/material.dart';

class KickCounter extends StatefulWidget {
  @override
  _KickCounterState createState() => _KickCounterState();
}

class _KickCounterState extends State<KickCounter> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Container(
      constraints: BoxConstraints(minHeight: screenSize.height),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/diary/bg.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          children: [
            Text(
              "5",
              style: new TextStyle(
                  fontSize: 30, color: Colors.white),
            ),
            Text(
              "Kicks 😍😍",
              style: new TextStyle(
                  fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
