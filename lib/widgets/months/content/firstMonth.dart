import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/factListItem.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';

class FirstMonthContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
// 2d317f - dark
    // 44b4f2
    var lightBlue = Color.fromRGBO(59, 186, 234, 1.0);
    var darkBlue = Color.fromRGBO(45, 49, 127, 1.0);
    return Container(
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

                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    "    The first month of the pregnancy starts after about three "
                    "weeks of your last menstruation. Generally you can get to know whether"
                    " you are pregnant or not, after about five to six weeks. During this time, your "
                    "physique and mental conditions start to change.",
                    style: TextStyle(color: darkBlue, fontSize: 16),
                  ),
                ),

                /// video preview
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 114, 224, 1.0)),
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/months/first/lady.png",
                          height: 180,
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "External changes during the 1st month",
                          style: TextStyle(fontSize: 18, color: lightBlue),
                        ),
                      ),
                      FactListItem(
                        text:
                            "Minor bleeding may occur with the onset of pregnancy.",
                      ),
                      FactListItem(
                        text:
                            "At the same time a hormone called Early Implantation Factor (EPF) is secreted by the body.",
                      ),
                      FactListItem(
                        text:
                            "This hormone prevents your body from rejecting the Fetus.",
                      ),
                      FactListItem(
                        text:
                            "At the same time, a hormone called HCG is secreted throughout the first three months.",
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Additionally,",
                        style: TextStyle(fontSize: 18, color: darkBlue),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "fatigue",
                              style: TextStyle(fontSize: 16, color: darkBlue),
                            ),
                            Text(
                              "frequent urination,",
                              style: TextStyle(fontSize: 16, color: darkBlue),
                            ),
                            Text(
                              "and enlargement of the breasts.",
                              style: TextStyle(fontSize: 16, color: darkBlue),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "    Abnormal cravings for certain foods also occur in the early "
                    "stages of pregnancy. Sometimes you may even feel a headache "
                    "due to the increase in these hormones.",
                    style: TextStyle(fontSize: 16, color: lightBlue),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "    Don’t be afraid that not all of the features mentioned above "
                    "were the same. Because not everyone shows these symptoms "
                    "the same way.",
                    style: TextStyle(fontSize: 16, color: lightBlue),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "For example, some mothers may not show symptoms such as nausea and vomiting during this period.",
                    style: TextStyle(fontSize: 16, color: lightBlue),
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
                    "Mental changes and stress",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "    The mental changes that take place in the first few months of "
                    "pregnancy are extremely noticeable. Because, you are now a woman "
                    "preparing for the most unique work in the world. When you think about it, "
                    "you feel happy and at the same time you may feel a little nervous. When you "
                    "think about the experience you had in the last delivery, the fear you "
                    "have about the baby, the way you prepare for the future, the mental level "
                    "will be more chaotic than before.",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "    As your daily routine changes and your attractiveness decreases, "
                    "stress increases and it can develop into depression.",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 14.0),
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "It is important that you discuss the following symptoms with your doctor.",
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/months/first/firstFace.png",
                                height: 100,
                              ),
                              Text(
                                "Mental confusion",
                                style: TextStyle(fontSize: 10, color: darkBlue),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/months/first/secondFace.png",
                                height: 100,
                              ),
                              Text(
                                "Frequent",
                                style: TextStyle(fontSize: 10, color: darkBlue),
                              ),
                              Text(
                                "uncontrollable crying",
                                style: TextStyle(fontSize: 10, color: darkBlue),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/months/first/thirdFace.png",
                                height: 100,
                              ),
                              Text(
                                "Sleeping problems",
                                style: TextStyle(fontSize: 10, color: darkBlue),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/months/first/fourthFace.png",
                              height: 100,
                            ),
                            Text(
                              "Frequent sadness,",
                              style: TextStyle(fontSize: 10, color: darkBlue),
                            ),
                            Text(
                              "irritability or irritability",
                              style: TextStyle(fontSize: 10, color: darkBlue),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/months/first/fifthFace.png",
                              height: 100,
                            ),
                            Text(
                              "Confusion of sexual desire.",
                              style: TextStyle(fontSize: 10, color: darkBlue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Overall, most women lovingly accept the noble pregnancy. "
                    "They make this period the happiest chapter of their lives.",
                    style: TextStyle(color: Colors.pink, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ;
  }
}
