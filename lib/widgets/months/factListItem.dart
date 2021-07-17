import 'package:flutter/material.dart';

class FactListItem extends StatelessWidget {
  final String text;
  const FactListItem({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var darkBlue = Color.fromRGBO(45, 49, 127, 1.0);

    return ListTile(
      minLeadingWidth: 5,
      contentPadding: EdgeInsets.only(top: 0, bottom: 0),
      leading: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 20,
      ),
      title: Text(
        text,
        style: TextStyle(color: darkBlue, fontSize: 16),
      ),
    );
  }
}