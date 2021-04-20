import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/videoPlayer.dart';

class VideoPreview extends StatelessWidget {
  final String iconName;
  final String text;

  const VideoPreview({Key key, this.iconName, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => VideoApp()))
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/lan/sin/$iconName",
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            Container(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 12),
              ),
              margin: EdgeInsets.only(top: 5),
            )
          ],
        ),
      ),
    );
  }
}
