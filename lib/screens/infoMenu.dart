import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/menuItem.dart';

class InfoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: new RadialGradient(colors: [
          Colors.white,
          Color.fromRGBO(208, 244, 247, 1),
        ])),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 15,
                ),
                child: Text(
                  Languages.of(context).menuTitle,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 23.0,
                    color: Color(0xFF2c6f91),
                  ),
                ),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 20,),
                child: Image.asset(
                    "assets/images/factPage/woman_standing.png"),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    MenuItem(iconName: "icon_item1", text: Languages.of(context).menuOption1, borderColor:0xFFd0f4f7 , boxColor:0xFFd0f4f7 ,),
                    MenuItem(iconName: "icon_item2", text: Languages.of(context).menuOption2, borderColor:0xffbedcfa , boxColor:0xFFbedcfa ,),
                    MenuItem(iconName: "icon_item3", text: Languages.of(context).menuOption3, borderColor:0xff98acf8 , boxColor:0xff98acf8 ,),
                    MenuItem(iconName: "icon_item5", text: Languages.of(context).menuOption4, borderColor:0xffb088f9 , boxColor:0xffb088f9 ,),
                    MenuItem(iconName: "icon_item6", text: Languages.of(context).menuOption5, borderColor:0xffda9ff9 , boxColor:0xFFda9ff9 ,),
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
