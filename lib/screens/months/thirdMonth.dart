import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/factListItem.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';

class ThirdMonth extends StatelessWidget {
  final String url = "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F3rd_Month_Saantha.mp4?alt=media&token=48ea728d-8549-4160-a193-7771033c3060";
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
                          "Third Month",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(255, 61, 227, 1)),
                        ),
                      ),
                    ],
                  ),

                  MonthSliderWidget(selectedMonth: 3,),

                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "    This is the last month of the first trimester of your pregnancy. You can observe a "
                      "rapid growth of the child during this time and also the world can see that you are pregnant.",
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
                            "    By this time, the fetus has begun to develop in the mother's womb. "
                            "At the beginning of this month, its height will be as small as 2.3 cm. But by the "
                            "end of the month, that size will grow to about 5.5 cm.The weight of the baby is about 14 g.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    During this month, the cells of the fetus divide rapidly. The fetus, which looked like a "
                            "collective of cells, gradually takes human form.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    Eyes, ears and nose develop. By the end of this month, the eyes will be able to move up, down, and in both directions.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    The heart grows and divides into chambers and the valves develop.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    In addition, the baby's hands and legs become elongated and begin to split "
                            "fingers and toes by the end of the month. The baby now can bend and stretch fingers.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    During this month the growth of internal organs such as the liver and stomach begins. "
                            "The urinary system and the bladder begin to develop separately.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    Towards the end of the month, the kidneys begin to filter urine.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    A rapid growth of the child’s facial muscles takes place.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    Facial expressions begin with that. The baby responds when the mother's abdomen is gently rubbed.",
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
                        FactListItem(
                          text:
                              "This period marks the end of the first trimester of the pregnancy. During this time your abdomen will gradually get bigger. The abdomen shows a significant change with the growth of the baby. The outside world clearly sees that you are going to be a mother.",
                        ),
                        FactListItem(
                          text:
                              "However in the case of some mothers, a noticeable enlargement of the abdomen cannot be seen at this time. You need not be concerned about this because, not everyone shows the same symptoms at the same time.",
                        ),
                        FactListItem(
                          text:
                              "By this time, the discomfort felt by most mothers is normal, and you will feel the need to urinate more often until the baby is born. This is because as the uterus gets bigger, the pressure on the bladder will continue to cause you discomfort. However, the probability of having an abortion has decreased.",
                        ),
                        FactListItem(
                          text:
                              "As the mother's uterus expands to accommodate the growing embryo, the skin on the abdomen is stretched. This can cause itching on the skin of the abdomen.",
                        ),
                        FactListItem(
                          text:
                              "Changes that occur on the skin during pregnancy are usually seen from this week. Stretch-marks appear on the skin of the mother's abdomen, breasts and thighs. You may also feel that your skin is more sensitive now more than it was before your pregnancy. Therefore, always pay attention to its safety.",
                        ),
                        FactListItem(
                          text:
                              "During this period, the mother’s feeling of sadness and joy are swayed from time to time. This change in mood is a common experience for most mothers during pregnancy. Never get stressed out. Take your time and always try to keep your mind clear. Listen to some good music that brings peace to the mind to improve mental health.",
                        ),
                        FactListItem(
                          text:
                              "Now, the mother may feel sleep deprivation more than ever. As the abdomen gets bigger, the mother may not be able to sleep in a comfortable position and the constant urge to urinate may also interfere with your sleep. Discuss the best position to lie down with your consultant physician.",
                        ),
                        FactListItem(
                          text:
                              "Inflammation of the breasts during this time is another problem that some mothers face. This is because of the enlargement of the stomach, which pushes its acids upwards. This situation can be seen in the second and third quarters. This is a very common condition that you have to face during pregnancy. It is best to eat a non-acidic diet to avoid this condition. Also avoid carbonated beverages.",
                        ),
                        FactListItem(
                          text:
                              "The nasal congestion that occurs during this time is caused by hormonal changes in the body",
                        ),
                        FactListItem(
                          text:
                              "Control your intake of hot and cold foods as much as possible during this time. Also, try to control your diet as much as possible. It is important for you and your baby to stay healthy.",
                        ),
                      ],
                    ),
                  ),

                  /// Green para

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "Scan to be done in the third month",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    Although the date of delivery is usually determined according to the last date of the mother's menstrual cycle, today the number of days is calculated by scanning between 11 and 14 weeks. It allows a woman who has an irregular menstrual cycle to have an accurate delivery date without a problem.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    This scan also helps to detect possible complications during the pregnancy as well as in the future. Therefore, it is mandatory for every mother to undergo this scan. It can confirm the life of the fetus, confirm the number of weeks of the fetus, identify chromosomal abnormalities, identify multiple embryonic stages, identify major fetal structural abnormalities as well as Down Syndrome.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    Premature births, stillbirths, pre-term births and maternal high blood pressure are some of the complications that this scan can identify and control. Scans can also be used to measure the length of the cervix and plan for any possible risks.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    The scan can also detect abnormalities in the fetal brain, nervous system, and spinal cord, as well as genetic and chromosome problems.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    Any mother may be at risk of having an abnormal baby and this scan can detect such abnormalities. Sometimes this scan is also done through the vagina to get more information.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    This scan, which is done between 11 and 14 weeks, can also look for other complications in the mother, such as ovarian cancer.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    margin: EdgeInsets.only(top: 20,),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "Role of the father",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "    As the baby grows, there are changes that take place in the mother's body as well as her mind.  So it is important to pay attention to her more than ever because that attention will help to strengthen her mentally.",
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "    Always make sure to keep her as happy as possible. Further strengthen the bonds and become a much needed strength to her in fulfilling this difficult and noble role.",
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "This connection between you and her will lead to delivering a healthy baby.",
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
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
