import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/monthItemList.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';
import 'package:mother_and_baby/widgets/months/paragraph.dart';

class NinthMonth extends StatelessWidget {
  final String url = "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F9th_Month_Maathota_1.mp4?alt=media&token=e2b8b6e6-47ac-4d72-9c91-8b5934a88301";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    var lightBlue = Color.fromRGBO(59, 186, 234, 1.0);
    var darkBlue = Color.fromRGBO(45, 49, 127, 1.0);
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(minHeight: screenSize.height),
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/diary/bg.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
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
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          "Ninth Month",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(255, 61, 227, 1)),
                        ),
                      ),
                    ],
                  ),

                  MonthSliderWidget(selectedMonth: 9,),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Preparing for the ninth month and childbirth",
                      style: TextStyle(
                          fontSize: 18,
                          color: darkBlue,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Paragraph(
                    color: darkBlue,
                    text:
                        "  Congratulations! You have reached the end of your pregnancy. You will be a mother very soon.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "  This is a period in your life that will bring joy as well as fear. But, there is nothing to worry about."
                        "This is going to be the best and most wonderful experience you will have in your life.",
                  ),

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Child’s Development",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  Your child will continue to develop and mature until the end of the third quarter of the pregnancy. "
                              "During this time, the child's lungs will become fully developed.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  The child can close eyes, move the head and grab things tightly and "
                              "also respond to noise, light and touch, as the reciprocal coordination is enhanced.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  However as your child prepares for birth, conditions will change during this month.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  The child will enter into your pelvis and usually the child’s head will be facing the vagina.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  At the end of the pregnancy, the child will be 46-51cm (18-20 inches) by length and about 3.2 kg (7 pounds) by weight.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  In the 9th month the child growing inside you will have a big impact on your body. You will experience the same level of discomfort you had in the past eight months. This includes tiredness, difficulty to sleep comfortably, "
                              "frequent passing of urine, difficulty to breath and adverse conditions such as varicose veins.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  Sometimes, the embryo slides into the lower part of the uterus. However this will help to reduce your constipation and "
                              "stomach upsets. However some embryos do not drop down to the uterus until the last minute.",
                        ),
                        Paragraph(
                          color: Colors.white,
                          text:
                              "  The best remedy to reduce the discomfort is to know everything related to child birth.",
                        ),
                      ],
                    ),
                  ),

                  /// video preview
                  MonthVideoPreview(url: url),

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(123, 246, 227, 195),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Pain during child birth",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.deepOrange,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Paragraph(
                          color: Colors.orange,
                          text:
                              "  The pain during child birth occurs due to the shrinking of womb muscles and the pressure built on the Cervix. This pain goes towards the stomach, hip and back muscles. Some women feel "
                              "the pain on the sides of the body and also on the thighs.",
                        ),
                        Paragraph(
                          color: Colors.orange,
                          text:
                              "  Another reason for the pain is the pressure generated by the child’s head pressing the "
                              "bladder and intestines and the stretching of the vaginal tract.",
                        ),
                        Paragraph(
                          color: Colors.orange,
                          text:
                              "  The pain during child birth varies from woman to woman.",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            "The pain differs",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.deepOrange,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Paragraph(
                          color: Colors.orange,
                          text:
                              "  Some women feel it is similar to menstrual pain. Some feel a huge pressure. Others may feel it is like diarrhea pain.",
                        ),
                        Paragraph(
                          color: Colors.orange,
                          text:
                              "  In this 9th month it is vital to keep your mental condition at a high level. As discussed before, try to talk to your partner about the issues. If you feel distressed, try to reach a psychiatric consultant.",
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: 10,),

                  /// role of the father
                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "Father’s role in the final month",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  You have to pay attention to your partner more than usual. That attention will help her to stay mentally strong.",
                  ),
                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  Try your best to keep her happy always. Strengthen your relationship more and more. Help her to be strong.",
                  ),
                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  As discussed in the eighth and ninth months, you should prepare all that is necessary for the mother and the child during child birth.",
                  ),
                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  In the ninth month, the changes in the mother are very much similar to the ones in the eighth and seventh months.",
                  ),
                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  However you should not be concerned about the changes in the mother’s body but only about the successful delivery with maximum protection to the mother and the child.",
                  ),
                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  Therefore kindly follow the advice given by the midwife, doctor and other medical service providers.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
