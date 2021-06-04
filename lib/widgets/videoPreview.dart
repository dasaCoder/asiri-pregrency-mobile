import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/videoPlayer.dart';

class VideoPreview extends StatelessWidget {
  final String iconName;
  final String text;
  final String url;
  const VideoPreview({Key key, this.iconName, this.text, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => VideoApp(url: url,)))
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/lan/sin/$iconName",
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Container(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 15),
              ),
              margin: EdgeInsets.only(top: 8),
            )
          ],
        ),
      ),
    );
  }
}
