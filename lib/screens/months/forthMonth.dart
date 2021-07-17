import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/factListItem.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';

class FourthMonth extends StatelessWidget {
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
                          "Fourth Month",
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
                      "    Now the child is developing gradually. The third month is over. The second trimester "
                          "begins with that. During this month you can observe a lot of changes in the baby as well "
                          "as the mother. Let's see one by one what these changes are…",
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
                            "    During these weeks and within the next few weeks, your baby will double in length and weight. By the end of the month, the head-to-toe length is about 11 cm and the weight is about 100 g.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    The baby's legs continue to develop and the head stays erect more than before. The emergence of hair patterns is a brand new development. At this point you can recognize that the baby has hair. Also, the growth of toenails has commenced. Many changes take place both internally and externally.The baby's body is still thin and not very strong. The baby’s body gradually develops external as well as internal structures.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    Blood vessels as well as bones can be seen through the transparent skin. The muscles slowly become stronger. The eyes are still not open and they continue to move to the right position on the face. The eyelids and eyebrows are developing.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "    The ear lobes get to the right position and continue to grow. The facial muscles also continue to grow and express emotions better than in previous months.",
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
                        FactListItem(text: "Your skin will gradually become clearer than before and better looking. The "
                            "little belly increasing in size and the bright face are pleasing to all who see you. This "
                            "radiance on the skin is a common feature of mothers during this time. This condition brings "
                            "happiness in spite of the previous discomfort felt in the body.",),
                        FactListItem(text: "Hormonal changes during pregnancy can cause your nails to grow faster. Also the "
                            "nails are brittle. This condition is very common during pregnancy. This gradually returns to normal "
                            "after the baby is born. Pay maximum attention to your nutrition during this time because your nutrition "
                            "determines the growth of your baby.  As mentioned earlier, avoid artificial foods as much as possible.",),
                        FactListItem(text: "It's important to avoid gastritis with hormonal changes during this time. Avoid consuming "
                            "alcohol and drugs. Such toxins directly affect the health of your unborn baby and will be an obstacle "
                            "to have a healthy baby.",),
                        FactListItem(text: "Another common complication during pregnancy is anemia. This is because of not "
                            "consuming food containing sufficient iron. You are now a pregnant mother and the amount of nutrition "
                            "you need is more than usual. Consult  a midwife or a doctor about your nutritional problems during this "
                            "time. They will give you the advice you need.",),
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
                      "Role of the father",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "    As mentioned earlier, your responsibilities during this period are immense. She receives the care, "
                          "protection and love she needs from you. She expects that from you. Because you are her most trusted "
                          "partner. Keep her happy as much possible throughout this period. Maintain a peaceful environment at home. "
                          "The strong connection between the two of you will give birth to a good, healthy baby in the near future.",
                      style: TextStyle(fontSize: 16, color: Colors.green),
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
