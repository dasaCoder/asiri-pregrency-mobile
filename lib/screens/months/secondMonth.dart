import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/factListItem.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';

class SecondMonth extends StatelessWidget {

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
                  Stack(children: [
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
                        "Second Month",
                        style: TextStyle(
                            fontSize: 24, color: Color.fromRGBO(255, 61, 227, 1)),
                      ),
                    ),
                  ],),

                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "    The physical and mental changes seen in the second month are very similar to "
                          "the changes seen in the first month. In addition, it is important to participate "
                          "in the monthly medical consultations. It is imperative to do so until the end of the second trimester. "
                          "There you will be subjected to a number of tests."
                          "For example, blood and urine tests.",
                      style: TextStyle(color: darkBlue, fontSize: 16),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                          "    Bleeding in the vagina is one of the common symptoms during this month."
                          "The features seen in this month are very similar to the changes seen in the first month."
                          "But this period includes your first medical clinic and tests.",
                      style: TextStyle(color: darkBlue, fontSize: 16),
                    ),
                  ),

                  /// video preview
                  MonthVideoPreview(url: url),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "External changes during the 2nd month",
                            style: TextStyle(fontSize: 18, color: lightBlue),
                          ),
                        ),
                        FactListItem(
                          text:
                          "As mentioned earlier, these changes are very similar to those of the first month. "
                              "These include fatigue, nausea, dizziness, the need for frequent urination, and changes in appetite.",
                        ),
                        FactListItem(
                          text:
                          "Also, if you use alcohol and drugs, your appetite will begin to drop."
                              "This is a very important and good thing. Because, some of these toxins can harm the developing baby in the womb."
                              "(Actually, it's very positive because mothers in our country do not use such toxins.)",
                        ),
                        FactListItem(
                          text:
                          "In addition, you will see a noticeable change in the size of your breasts and nipples.",
                        ),
                        FactListItem(
                          text:
                          "Hormonal changes can cause a white discharge to come out of your vagina.",
                        ),
                        FactListItem(
                          text:
                          "The softening of your gums takes place during this time. It is very important to pay more attention to dental health.",
                        ),
                        FactListItem(
                          text:
                          "During this time, your ovaries produce a hormone called progesterone.",
                        ),
                        FactListItem(
                          text:
                          "It also increases the amount of blood circulating. It is important for the development of the child.",
                        ),
                        FactListItem(
                          text:
                          "The baby moves slowly in the womb. But that is not enough for you to feel.",
                        ),
                        FactListItem(
                          text:
                          "During this time, take all measures to prevent possible accidents.",
                        ),
                        FactListItem(
                          text:
                          "In addition, get more healthy sleep. Also get enough exercise.",
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
                      "Mental changes and stress",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    The mental changes seen during this period (first trimester) are very similar to the changes in the first month."
                          "The changes in your mind with this new experience are pretty much normal."
                          "If you have any doubts or fears, talk to a doctor or the midwife."
                          "They will give you the advice you need.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      "    When you think about the experience you had in the last delivery, the fear you have about the baby, the way you prepare for the future, the mental level will be more chaotic than before."
                          "As your daily routine changes and your attractiveness decreases, stress increases and it can develop into depression.",
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
                        Container(
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
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/months/first/secondFace.png",
                                height: 100,
                              ),
                              Text(
                                "Frequent crying",
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
                                "assets/images/months/first/thirdFace.png",
                                height: 100,
                              ),
                              Text(
                                "Sleep disturbance",
                                style: TextStyle(fontSize: 10, color: darkBlue),
                              ),
                            ],
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
                                "anger or irritability",
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
        ),
      ),
    );
  }
}

