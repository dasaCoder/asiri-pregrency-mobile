import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onClicked;

  const DrawerListItem({Key key, @required this.imagePath, @required this.title, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/images/drawer/${imagePath}",
        height: 25,
      ),
      title: Text(title),
      onTap: () => this.onClicked(),
    );
  }
}
