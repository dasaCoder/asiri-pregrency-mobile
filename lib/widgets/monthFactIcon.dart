import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/main.dart';

class MonthFactIcon extends StatefulWidget {
  MonthFactIcon({Key key, this.month, this.iconPath});

  final String month;
  final String iconPath;

  @override
  _MonthFactIconState createState() => _MonthFactIconState();
}

class _MonthFactIconState extends State<MonthFactIcon> {
  void navigateToMonth(month) {
    switch(month) {
      case 'first':
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomePage(
              title: "test s",
            )));
        break;
      case '2month':
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomePage(
              title: "test s",
            )));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          navigateToMonth(widget.iconPath);
        },
        child: Column(
          children: [
            Center(
              child: Container(
                height: 75,
                width: 100,
                child: SvgPicture.asset(
                  "assets/images/factPage/${widget.iconPath}.svg",
                  height: 70,
                  width: 70,
                  allowDrawingOutsideViewBox: false,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      widget.month,
                      style: new TextStyle(
                          fontSize: 16.0, color: Color(0xFFf16161)),
                    ),
                    Text(
                      Languages.of(context).monthString,
                      style: new TextStyle(
                          fontSize: 15.0, color: Color(0xFFf16161)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
