import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/widgets/videoPreview.dart';

class SpecialistPage extends StatelessWidget {
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
                    Languages.of(context).specialistTopic,
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

          ],
        ),
      ),
    );
  }
}
