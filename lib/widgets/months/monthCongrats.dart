import 'package:flutter/material.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:intl/intl.dart';

class MonthCongratsWidget extends StatelessWidget {
  const MonthCongratsWidget({
    Key key,
    @required this.screenSize,
    @required this.userDatails, this.currentMonth,
  }) : super(key: key);

  final Size screenSize;
  final AsiriUser userDatails;
  final int currentMonth;

  @override
  Widget build(BuildContext context) {

    String getMonthCaption() {
      String caption = "first";
      switch (currentMonth) {
        case 2:
          caption = "second";
          break;
        case 3:
          caption = "third";
          break;
        case 4:
          caption = "fourth";
          break;
        case 5:
          caption = "fifth";
          break;
        case 6:
          caption = "sixth";
          break;
        case 7:
          caption = "seventh";
          break;
        case 8:
          caption = "eighth";
          break;
        case 9:
          caption = "ninth";
          break;
      }
      return caption;
    }

    return Container(
      // height: screenSize.height * 0.3,
      width: screenSize.width,
      padding: EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)),
        color: Colors.purple,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                    // Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 30,
                    child: Image.asset(
                      "assets/images/drawer/burger.png",
                      height: 15,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Congratulations!",
                          style: new TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "You are in the ${getMonthCaption()} month of your pregnancy",
            style: TextStyle(color: Colors.white, fontSize: 22),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          if (userDatails != null && userDatails.dueDate != null)
            Text(
              "Your due date is ${DateFormat("MMMM d, yyyy").format(DateTime.fromMillisecondsSinceEpoch(userDatails.dueDate))}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
        ],
      ),
    );
  }
}