import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/videoPreview.dart';

class SpecialistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: new RadialGradient(colors: [
          Colors.white,
          Color.fromRGBO(212, 252, 208, 1.0),
        ])),
        padding: EdgeInsets.only(top: 10, left: 30, right: 40),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 15,
              ),
              child: Text(
                Languages.of(context).specialistTopic,
                style: new TextStyle(fontSize: 23.0, color: Color(0xFF13a334)),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoPreview(
                  iconName: "Dental.jpg",
                  text: Languages.of(context).specialistCaption1,
                ),
                VideoPreview(
                  iconName: "Normal.jpg",
                  text: Languages.of(context).specialistCaption2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoPreview(
                  iconName: "Diabitic.jpg",
                  text: Languages.of(context).specialistCaption3,
                ),
                VideoPreview(
                  iconName: "Expecting.jpg",
                  text: Languages.of(context).specialistCaption4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoPreview(
                  iconName: "Cisserian.jpg",
                  text: Languages.of(context).specialistCaption5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
