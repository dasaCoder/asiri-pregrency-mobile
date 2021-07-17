import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({
    Key key,
    @required this.color, this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: color),
      ),
    );
  }
}