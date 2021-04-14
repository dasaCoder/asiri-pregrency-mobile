import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mother_and_baby/lan/Languages.dart';

import '../widgets/monthFactIcon.dart';

class MonthsFactsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      // floatingActionButton: SvgPicture.asset("assets/images/factPage/2month.svg"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: new BoxDecoration(
                gradient: new RadialGradient(colors: [
              Colors.white,
              Color.fromRGBO(254, 223, 202, 1),
            ])),
            padding: EdgeInsets.only(top: 10, left: 30, right: 40),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: 15,
                    ),
                    child: Text(
                      Languages.of(context).monthFactsTitle,
                      style: new TextStyle(
                          fontSize: 23.0, color: Color(0xFF571338)),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: SvgPicture.asset(
                        "assets/images/factPage/woman_standing.svg"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthFactIcon(
                          month: Languages.of(context).first,
                          iconPath: 'first',
                        ),
                        MonthFactIcon(
                          month: Languages.of(context).second,
                          iconPath: '2month',
                        ),
                        MonthFactIcon(
                          month: Languages.of(context).third,
                          iconPath: '3month',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthFactIcon(
                          month: Languages.of(context).fourth,
                          iconPath: '4month',
                        ),
                        MonthFactIcon(
                          month: Languages.of(context).fifth,
                          iconPath: '5month',
                        ),
                        MonthFactIcon(
                          month: Languages.of(context).sixth,
                          iconPath: '6month',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthFactIcon(
                          month: Languages.of(context).seventh,
                          iconPath: '7month',
                        ),
                        MonthFactIcon(
                          month: Languages.of(context).eighth,
                          iconPath: '8month',
                        ),
                        MonthFactIcon(
                          month: Languages.of(context).nine,
                          iconPath: '9month',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: SvgPicture.asset(
                              "assets/images/factPage/2month.svg"),
                          height: 50,
                          width: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
