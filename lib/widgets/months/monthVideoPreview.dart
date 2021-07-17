import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/videoPlayer.dart';

class MonthVideoPreview extends StatelessWidget {
  const MonthVideoPreview({
    Key key,
    @required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 164, 179, 1), borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.only(top: 15, bottom: 15),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => VideoApp(
                    url: url,
                  )))
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.pink,
                    size: 60,
                  ),
                  Text(
                    "Play",
                    style: TextStyle(
                        fontSize: 18, color: Colors.pink),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/images/months/first/lady.png",
              height: 180,
            ),
          )
        ],
      ),
    );
  }
}