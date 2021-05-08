import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onClicked;

  const DrawerListItem({Key key, @required this.imagePath, @required this.title, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: InkWell(
        onTap: (){
          onClicked();
        },
        child: Row(
          children: [
            Container(
              width: 30,
              child: Image.asset(
                "assets/images/drawer/${imagePath}",
                height: 25,
              ),
            ),
            Container(
              child: Text(
                title,
                style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(
                    70,72,162,1)),
              ),
              padding: EdgeInsets.only(left: 20),
            )
          ],
        ),
      ),
    );
  }
}
