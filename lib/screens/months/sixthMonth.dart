import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/monthItemList.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';
import 'package:mother_and_baby/widgets/months/paragraph.dart';

class SixthMonth extends StatelessWidget {
  final String url = "";
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
                          "Sixth Month",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(255, 61, 227, 1)),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "    You are in the final trimester of your pregnancy. You have only three months more to become a mother. Let us find out what are the significant changes that happen to you and your baby during the sixth month.",
                      style: TextStyle(color: darkBlue, fontSize: 16),
                    ),
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
                            "Development of the Child and other changes",
                            style: TextStyle(fontSize: 18, color: Colors.white, ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Paragraph(color: Colors.white, text: "By the 24th week of pregnancy, your baby is growing rapidly and weighs about 600 grams. The height from head to toe is about 30 cm.The taste buds of the tongue continue to develop. The brain is developing rapidly and the brain cells, as "
                            "well as the inner ear, which are needed to maintain memory and alertness, are now completely developed.",),
                        Paragraph(color: Colors.white, text: "Although the baby has translucent skin, that condition will change very soon. We talked about this in the previous months. The baby's hair is white. That's because the melanin pigment has not yet been formed. The production of white blood "
                            "cells, which are needed to prevent infections, has now begun.",),
                        Paragraph(color: Colors.white, text: "Your baby's eyes are still closed, but from time to time, faint eyebrows flutter above the lids. When he is not asleep, your child may "
                            "respond to sound, especially to the sound of your voice.",),
                        Paragraph(color: Colors.white, text: "By this month, your baby's lungs are fully formed. Of course, still there are a few conditions that need to be developed before the baby is ready to face the outside world. Your baby's sucking ability is improving, and the baby is "
                            "searching for his thumb at this very moment you are reading this article.",),
                      ],
                    ),
                  ),

                  /// video preview
                  MonthVideoPreview(url: url),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Changes in the mother",
                            style: TextStyle(fontSize: 18, color: lightBlue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Paragraph(
                    color: darkBlue,
                    text:
                        "Now your life is going to change even more. You may feel the baby's movements very strongly during this time. That’s very normal. If you pay close attention to this you will be able to identify a pattern in these movements. This means that you can identify when the child is sleepy and when he is bright and awake. Do not miss this "
                            "experience because, you will not enjoy this experience after childbirth.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "You should not worry about any discharge from the vagina that may occur at this time. That is common to  most women.This is a condition that can occur due to hormonal changes during pregnancy as well as an increase in blood volume in "
                            "the body. If the discharge is odorless, there is no need to worry.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "Also, cramps, insomnia, nasal congestion, extreme hunger, and the need to urinate frequently are the most common conditions during pregnancy.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "By now, you may have gained up to 17 pounds, but it is enough if you maintain your weight in line with your BMI.",
                  ),


                  /// Green para

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "Be aware of important Fitness and Exercise during pregnancy",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "Do you know that exercise is important for maintaining good health during pregnancy? Although many mothers are aware of the importance of exercise in maintaining good health, "
                            "they lapse into an inactive lifestyle due to the discomfort and lethargy that come with being pregnant.",
                  ),
                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "Exercise not only helps a pregnant woman to maintain a good mental state and post-natal body shape, but also helps to prevent back "
                            "pain and joint pain during pregnancy. Exercise also contributes to the well-being of abdominal muscles.",
                  ),
                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "It is important to exercise to prepare the body for childbirth. However, if you have a medical condition, consult your doctor about exercising.",
                  ),
                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "Simple exercise that is suitable for a pregnant mother includes walking, swimming and even aerobic exercise under a qualified trainer.",
                  ),
                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "Relaxation of the muscles around the vagina with about 10 seconds of Keegel exercise can strengthen the area around the vagina and is a very important exercise for a pregnant mother.This is an easy and useful exercise that can be done in any posture. "
                            "This exercise can be beneficial not only during pregnancy but at any time in life.",
                  ),

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
                      "Role of the father",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Paragraph(color: Colors.pinkAccent, text: "By now, the baby inside the mother is more than five months old. That means more than half of the pregnancy is over. So now, little by little, start planning for the future with her. Design the room creatively. Let her see pleasing pictures of babies. "
                      "This will strengthen her mental health as well as her postpartum mood.",),
                  Paragraph(color: Colors.pinkAccent, text: "Always keep her happy. Do not forget to maintain a peaceful environment at home. As everyone says, you are her most trusted partner.",),
                  Paragraph(color: Colors.pinkAccent, text: "So pay as much attention to her as possible during this time and protect her from accidents.",),
                  Paragraph(color: Colors.pinkAccent, text: "The result of the sacrifices you make during this time will be rewarded in the smile of a baby that will come soon.",),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
