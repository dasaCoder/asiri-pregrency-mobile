import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/screens/monthsFactHome.dart';
import 'package:mother_and_baby/screens/specialistPage.dart';

class MenuItem extends StatelessWidget {
  final String iconName;
  final int borderColor;
  final int boxColor;
  final String text;

  MenuItem({this.iconName, this.borderColor, this.boxColor, this.text});

  @override
  Widget build(BuildContext context) {
    void navigateToFact(fact) {
      switch (fact) {
        case "icon_item1":
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MonthsFactsHome()));
          break;
          case "icon_item2":
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => SpecialistPage()));
          break;
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              "assets/images/menu/$iconName.png",
              height: 30,
            ),
            width: 100,
          ),
          InkWell(
            onTap: () {
              navigateToFact(iconName);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(borderColor),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(boxColor)),
              padding: EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF002736),
                  ),
                ),
              ),
              width: 250,
            ),
          )
        ],
      ),
    );
  }
}
