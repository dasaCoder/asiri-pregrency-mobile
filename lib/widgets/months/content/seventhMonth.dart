import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/monthItemList.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';
import 'package:mother_and_baby/widgets/months/paragraph.dart';

class SeventhMonthContent extends StatelessWidget {
  final String url = "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F7th_Month_Maathota_1.mp4?alt=media&token=6a5d9811-7ac3-472f-9214-7c4d00dd348b";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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

                  Paragraph(color: darkBlue, text: "  You are now in the seventh month of your pregnancy. As you gradually get close to achieving wonderful motherhood, during this month as in the "
                      "previous months, you as well as your baby will experience some special changes.",),

                  Paragraph(color: darkBlue, text: "  Most importantly, you should keep in mind that this is the last trimester in your pregnancy. "
                      "This is the time when you need to be more focused than during other quarters.",),

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
                            "Changes in the baby",
                            style: TextStyle(fontSize: 18, color: Colors.white, ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Paragraph(color: Colors.white, text: "  When you are seven months pregnant, your baby is busy developing the organs and systems that help sustain life outside the womb. For example, the baby's lungs begin to produce a fluid called "
                            "surfactant, which allows his lungs to expand and contract as required.",),
                        Paragraph(color: Colors.white, text: "  Your baby can now open and close his eyes. During this time, your baby will notice changes between light and "
                            "darkness and will respond to bright light by moving or kicking.",),
                        Paragraph(color: Colors.white, text: "  During this time, fat is deposited on the baby's wrinkles and the extra fat helps to soothe the baby's wrinkles. Meanwhile, the skin cells begin to produce the "
                            "pigment melanin, which gives the skin its natural color.",),
                        Paragraph(color: Colors.white, text: "  By the end of the month, the baby will weigh 3 pounds and its full length will be about 10 1/2 inches.",),
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
                            "Changes in your pregnant body",
                            style: TextStyle(fontSize: 18, color: lightBlue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Paragraph(
                    color: darkBlue,
                    text:
                        "From the beginning of your third trimester you can expect to gain as much as a pound a week. Check your pre-pregnancy BMI and find out about healthy pregnancy weight "
                            "gain, the steps of your weight gain and discuss this with the midwife as well as your doctor.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "As your abdomen grows and you are seven months pregnant, your healthcare provider or family "
                            "health worker will begin to measure your height.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "This will help determine the distance between your pubic bone and the upper part of the womb. This distance is measured in centimeters and is often "
                            "recorded as a length corresponding to your week of pregnancy.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "So, if you are 28 weeks pregnant, your initial height measurement may be about 28 centimeters (11.02 inches). These measurements are just a tool to monitor "
                            "your baby's steady growth and measurements may not be accurate for all mothers.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "During this month, your family health worker will check on you regularly. This is because you are now slowly approaching the period closest to childbirth.",
                  ),


                  /// Green para

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "Pregnancy tests you should do this month",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
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
                    text: "Height of the womb",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Size and shape of the womb",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Size and location of the fetus",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),

                  Paragraph(
                    color: Colors.deepPurpleAccent,
                    text:
                        "  Swelling of the ankles and feet, especially headaches, changes in vision, or abdominal pain can be a sign of high blood pressure in pregnancy. If you are Rh-negative, "
                            "your doctor may give you a RO-GAM vaccine this month to prevent complications.",
                  ),

                  /// mental condition

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
                            "Changes in the baby",
                            style: TextStyle(fontSize: 18, color: Colors.deepOrange, ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Paragraph(color: Colors.orange, text: "  You need to pay special attention to the postpartum pain and mental conditions that occur during this last trimester. It is imperative that you are always happy and be "
                            "sure to tell your problems to your husband or to a trusted relative.",),
                        Paragraph(color: Colors.orange, text: "  From this month onwards, there is a possibility of developing labor pains and childbirth at any time and therefore you should pay special attention to this possibility. You can always let your child listen to pleasing music. If you are doing a job it is better "
                            "if you avoid the tedious tasks and stressful situations of the job.",),
                        ],
                    ),
                  ),

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
                      "Role of the father",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  Paragraph(color: Colors.pinkAccent, text: "For a father, this is the time when you must be most vigilant. Try to get closer to your wife more and more. "
                      "Comfort the wife whenever possible and show her love and care all the time.",),
                  Paragraph(color: Colors.pinkAccent, text: "You need to have a plan as to how you will act in case of the onset of labor pains or childbirth.  As a father, the time has come for you to think about the facilities "
                      "required for the baby as well as the facilities to be provided to the mother after delivery.",),
                ],
              ),
            ),
          ),
        );
  }
}
