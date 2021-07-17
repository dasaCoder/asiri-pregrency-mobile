import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/monthItemList.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';
import 'package:mother_and_baby/widgets/months/paragraph.dart';

class FifthMonth extends StatelessWidget {
  final String url = "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F5th_Month.mp4?alt=media&token=4d4e3a89-b3ff-45a5-90f6-8780457e0e3a";
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
                          "Fifth Month",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(255, 61, 227, 1)),
                        ),
                      ),
                    ],
                  ),

                  MonthSliderWidget(selectedMonth: 5,),

                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "    You are in the middle of the second trimester of pregnancy. This month, "
                      "the fifth month of wonderful motherhood, we focus on some of the changes that will happen to you and your baby.",
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
                            "Development of the Child",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    During the fifth month of pregnancy, your baby becomes more and more active. You can often experience this in the evening.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    At the beginning of this month you can feel that your baby is moving and kicking. By the end of the month, "
                            "your baby will be back to regular activity and sleep patterns. You may feel that the baby is more active when you try to rest.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    During this month, the baby continues to develop. By this month, the head is smaller compared "
                            "to the rest of the body and the lower limbs are longer. During this period, the baby is covered with soft hair called 'lanumago'.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    The hair on the baby's head begins to grow. The eyebrows are also starting to appear. Bone "
                            "growth is active during this time and by the end of the 18th week the bones are clearly visible. In addition, "
                            "the tooth buds are visible and the fingers are separated.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    By the end of the 18th week, the baby begins to suck and swallow and is nourished by the placenta. Despite its human "
                            "appearance, the baby cannot live outside the womb at this time.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    By 19 weeks the skin is thinner and less fatty. By 20 weeks the skin is covered with a coating called vernix. Vernix "
                            "protects the skin from exposure to amniotic fluid.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    'Lanugo' helps to retain vernix on the skin. During this time, brown fat begins to form around the "
                            "baby's body parts. Most of the fat is deposited in the area around the neck, breasts and kidneys.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    If it is a girl, by 20 weeks the ovaries contain Follicles and the uterus and vagina begin to develop.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
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
                        MonthItemList(
                          text: "Fatigue",
                        ),
                        MonthItemList(
                          text: "Constipation",
                        ),
                        MonthItemList(
                          text: "Digestion issues",
                        ),
                        MonthItemList(
                          text: "Nasal congestion or nosebleeds",
                        ),
                        MonthItemList(
                          text: "Bleeding gums",
                        ),
                        MonthItemList(
                          text: "Increasing appetite",
                        ),
                        MonthItemList(
                          text: "Swollen ankles",
                        ),
                        MonthItemList(
                          text: "Varicose veins",
                        ),
                        MonthItemList(
                          text: "White vaginal discharge",
                        ),
                        MonthItemList(
                          text: "Difficulty in breathing",
                        ),
                        MonthItemList(
                          text: "Back pain",
                        ),
                        MonthItemList(
                          text: "Skin pigmentation",
                        ),
                      ],
                    ),
                  ),

                  Paragraph(
                    color: darkBlue,
                    text:
                        "During the beginning of this month, your baby's heart rate will begin to increase to provide more blood "
                        "to meet your baby's oxygen needs.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "You will get used to carrying the increased weight on your legs as well as your abdomen. Remember to exercise "
                        "gently throughout your pregnancy. As the uterus continues to compress, your stomach area extends out.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "The growing uterus pushes against your lungs and also pushes out your abdomen. You may have difficulty "
                        "breathing because your lungs are close to other internal organs.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "Wearing seat belts while riding in a car can be difficult with your enlarged stomach, but you still "
                        "need to put on seat belts. The strap can be fastened below your abdomen, across your pelvis and upper thighs.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "During this month your chest will expand and your breasts will enlarge. Your nipples become soft and small bumps may appear around the nipples. "
                        "These nodules are called sebaceous glands, which discharge a fatty oil named, sebaceous.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "Hormones in your endocrine system may cause varicose veins, which can result in leg cramps. To reduce varicose veins, avoid standing for long periods. You can take "
                        "comfort in the fact that these veins often disappear after childbirth.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "Excess weight can cause you extra fatigue. See your doctor if you are extremely tired, as this can be a sign of anemia. From the middle of the month, the itching "
                        "around your large abdomen may increase.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "As your body retains more fluid than usual, your feet and ankles may begin to swell. Make sure you wear comfortable shoes and tell your doctor about any change, such as headaches, changes in vision, or abdominal pain.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "At the end of this month, you may feel some aches and pains. The growing baby and the expanding uterus can begin to push the lower ribs out a bit and cause discomfort. Relaxation and massage will help to reduce the aches and pains.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "Hormones can cause your eyesight to drop sharply and some artificial lenses will no longer be comfortable for you. Therefore, it is best to postpone buying a new pair of glasses or contact lenses while you are pregnant.",
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
                      "Scan to be done in the third month",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "This month's medical visit is similar to the previous month's visit. Your healthcare provider will check the following.",
                  ),

                  MonthItemList(
                    text: "Weight",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Blood Pressure",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Urine",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Fetal heart rate",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "The size and shape of the uterus",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text:
                        "Swelling of the ankles or feet, especially headaches, changes in vision, or abdominal pain "
                        "can be signs of high blood pressure during the pregnancy.",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),

                  Paragraph(color: Colors.deepPurpleAccent, text: "Some women at high risk may be offered a test called ‘Cordocentesis’ to diagnose and confirm chromosomal abnormalities or whether there is a definite birth defect. In this test, a hollow needle is inserted into a small vein near the placenta,"
                      " through the mother's abdominal wall, and a sample of the baby's blood is collected. This test is "
                      "done around the 18th week of pregnancy."),
                  Paragraph(color: Colors.deepPurpleAccent, text: "You may experience emotional changes and depression during the second trimester of the pregnancy. "
                      "Moods are different than in the first or third trimester of this quarter."),
                  Paragraph(color: Colors.deepPurpleAccent, text: "You may feel frustrated that you can no longer control the look of your body and you may want to reassure your partner that you are "
                      "still beautiful and sexy. However you have to keep in mind that appearances are not important compared to motherhood."),
                  Paragraph(color: Colors.deepPurpleAccent, text: "Depression in the second trimester is lower during pregnancy than at any other time. Depression during these months "
                      "is usually associated with anxiety and pain in previous pregnancies."),
                  Paragraph(color: Colors.deepPurpleAccent, text: "For example, if a woman has had a difficult previous pregnancy, she may be suffering from depression. Existing marital "
                      "problems can also lead to depression."),
                  Paragraph(color: Colors.deepPurpleAccent, text: "It is best to try to talk to your partner about any problems you may have. Supportive psychotherapy can also help if "
                      "you feel particularly distressed."),

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

                  Paragraph(color: Colors.pinkAccent, text: "It is the role of the father to try to comfort his pregnant wife at all times. Give her a lot of love no matter how physically changed she is.",),
                  Paragraph(color: Colors.pinkAccent, text: "Remind her that the beauty and appearances are not important in the face of the great title of motherhood she is about to receive and that she will be loved as a mother more than ever.",),
                  Paragraph(color: Colors.pinkAccent, text: "Undoubtedly, your love will greatly affect her successful delivery of the baby.",),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
