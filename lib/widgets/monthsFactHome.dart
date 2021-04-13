import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';

class MonthsFactsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [
            Color.fromARGB(255, 25, 178, 238),
            Color.fromARGB(255, 21, 236, 229),
            Color.fromARGB(255, 25, 178, 238),
          ])),
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 15,
                ),
                child: Text(
                  Languages.of(context).appName,
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 125,
                      child: Column(
                        children: [
                          Image.asset("assets/images/bear.png"),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "This is first month",
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
