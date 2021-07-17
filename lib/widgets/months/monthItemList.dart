import 'package:flutter/material.dart';

class MonthItemList extends StatelessWidget {
  MonthItemList({
    Key key, this.text, this.iconColor = Colors.pink, this.leadingIcon = Icons.favorite, this.fontColor = const Color.fromRGBO(45, 49, 127, 1.0)
  }) : super(key: key);

  final String text;
  Color iconColor;
  IconData leadingIcon;
  Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Icon(
              leadingIcon,
              color: iconColor,
              size: 18,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: TextStyle(color: fontColor, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}