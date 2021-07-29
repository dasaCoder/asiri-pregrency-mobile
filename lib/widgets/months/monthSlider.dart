import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/months/eighthMonth.dart';
import 'package:mother_and_baby/screens/months/fifthMonth.dart';
import 'package:mother_and_baby/screens/months/firstMonth.dart';
import 'package:mother_and_baby/screens/months/forthMonth.dart';
import 'package:mother_and_baby/screens/months/ninthMonth.dart';
import 'package:mother_and_baby/screens/months/secondMonth.dart';
import 'package:mother_and_baby/screens/months/seventhMonth.dart';
import 'package:mother_and_baby/screens/months/sixthMonth.dart';
import 'package:mother_and_baby/screens/months/thirdMonth.dart';

class MonthSliderWidget extends StatelessWidget {
  MonthSliderWidget({
    Key key, @required this.selectedMonth, this.toggleNext, this.togglePrev,
  }) : super(key: key);

  final Color  lightBlue = Color.fromRGBO(59, 186, 234, 1.0);
  final int selectedMonth;
  final VoidCallback toggleNext;
  final VoidCallback togglePrev;

  void goToMonthDescription(BuildContext context, int month) {
    switch (month) {
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FirstMonthScreen()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SecondMonth()));
        break;
      case 3:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => ThirdMonth()));
        break;
      case 4:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FourthMonth()));
        break;
      case 5:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => FifthMonth()));
        break;
      case 6:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => SixthMonth()));
        break;
      case 7:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SeventhMonth()));
        break;
      case 8:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => EighthMonth()));
        break;
      case 9:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => NinthMonth()));
        break;
      default:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FirstMonthScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => {togglePrev()},
            child: Icon(
              Icons.arrow_left_rounded,
              size: 80,
              color: lightBlue,
            ),
          ),
          Container(
            child: Image.asset(
              "assets/images/factPage/${selectedMonth}month.png",
              height: 100,
            ),
          ),
          InkWell(
            onTap: () => {toggleNext()},
            child: Icon(
              Icons.arrow_right_rounded,
              size: 80,
              color: lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}