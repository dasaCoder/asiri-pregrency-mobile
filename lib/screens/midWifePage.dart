import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/videoPreview.dart';

class MidWifePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
        BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Scaffold.of(context).openDrawer();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                          color: Color.fromRGBO(161, 129, 239, 1),
                        ),
                      ),
                    ),
                    Text(
                      Languages.of(context).midWifeTitle,
                      style: new TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(161, 129, 239, 1)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30, right: 40),
                child: Column(
                  children: [
                    VideoPreview(
                      iconName: "Dental.jpg",
                      text: Languages.of(context).midWifeCaption1,
                      url: "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F%E0%B7%83%E0%B7%92%E0%B7%83%E0%B7%9A%E0%B6%BB%E0%B7%92%E0%B6%BA%E0%B6%B1%E0%B7%8A%20%E0%B7%83%E0%B7%90%E0%B6%AD%E0%B7%8A%E0%B6%9A%E0%B6%B8.mp4?alt=media&token=a581a8c5-80e3-4391-a4dd-2ea95ae8fefd",
                    ),

                    VideoPreview(
                      iconName: "Dental.jpg",
                      text: Languages.of(context).specialistCaption1,
                      url: "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F%E0%B7%83%E0%B7%92%E0%B7%83%E0%B7%9A%E0%B6%BB%E0%B7%92%E0%B6%BA%E0%B6%B1%E0%B7%8A%20%E0%B7%83%E0%B7%90%E0%B6%AD%E0%B7%8A%E0%B6%9A%E0%B6%B8.mp4?alt=media&token=a581a8c5-80e3-4391-a4dd-2ea95ae8fefd",
                    ),

                    VideoPreview(
                      iconName: "Dental.jpg",
                      text: Languages.of(context).specialistCaption1,
                      url: "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F%E0%B7%83%E0%B7%92%E0%B7%83%E0%B7%9A%E0%B6%BB%E0%B7%92%E0%B6%BA%E0%B6%B1%E0%B7%8A%20%E0%B7%83%E0%B7%90%E0%B6%AD%E0%B7%8A%E0%B6%9A%E0%B6%B8.mp4?alt=media&token=a581a8c5-80e3-4391-a4dd-2ea95ae8fefd",
                    ),

                    VideoPreview(
                      iconName: "Dental.jpg",
                      text: Languages.of(context).specialistCaption1,
                      url: "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F%E0%B7%83%E0%B7%92%E0%B7%83%E0%B7%9A%E0%B6%BB%E0%B7%92%E0%B6%BA%E0%B6%B1%E0%B7%8A%20%E0%B7%83%E0%B7%90%E0%B6%AD%E0%B7%8A%E0%B6%9A%E0%B6%B8.mp4?alt=media&token=a581a8c5-80e3-4391-a4dd-2ea95ae8fefd",
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
