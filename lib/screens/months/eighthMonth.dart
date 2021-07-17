import 'package:flutter/material.dart';
import 'package:mother_and_baby/widgets/months/monthItemList.dart';
import 'package:mother_and_baby/widgets/months/monthSlider.dart';
import 'package:mother_and_baby/widgets/months/monthVideoPreview.dart';
import 'package:mother_and_baby/widgets/months/paragraph.dart';

class EighthMonth extends StatelessWidget {
  final String url = "https://firebasestorage.googleapis.com/v0/b/asiri-hospital-tour.appspot.com/o/videos%2F8th_Month_Maathota_1.mp4?alt=media&token=7aa03f8b-b61f-4fec-b294-81a5efe0ebc9";
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
                          "Eighth Month",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(255, 61, 227, 1)),
                        ),
                      ),
                    ],
                  ),

                  MonthSliderWidget(selectedMonth: 8,),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Development of the child",
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
                        "  When you are eight months pregnant, your baby will quickly gain weight and increase in fat, and his weight will be closer to the final birth weight. In the last few weeks, the thin hair called lanugo that has covered his small body is starting to disappear. It is during this time that the hair on his head begins to grow instead. This is another development to look forward to. You can see the baby's hair when he is born. Underneath that hair, your baby's brain is constantly developing and has "
                        "developed a well-coordinated ability to control his body temperature.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "  Although some of the baby’s bones have begun to thicken, his skull is still soft, allowing him to pass more easily through the birth canal. Do not be afraid of that. Your child may also be a little more active this month. His activities may range from hiccups to stretching and kicking. When you are eight months "
                        "pregnant, you may experience other exceptional movements.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "  Your healthcare provider may suggest that you count your baby's movements every day. It will be a good activity to improve your mental health too. One way, is to consider how long it takes to feel 10 clear movements. As soon as you eat, your baby becomes more active. So this is often a good "
                        "time to sit still and count the baby's movements.",
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
                            "Changes in your body during the eighth month of pregnancy",
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
                              "  Maintaining a healthy diet is very important when you are eight months pregnant. By doing that, your baby gets the nutrients he needs during the last stages of the pregnancy.  Not only that, you also need to raise your own energy level and strengthen your body. You may feel listless as your stomach expands.  However a balanced diet will give you the necessary strength to do some mild exercises that will help you to sleep "
                              "well and keep both you and the baby happy.",
                        ),
                      ],
                    ),
                  ),

                  /// video preview
                  MonthVideoPreview(url: url),

                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
                    margin: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "Difficulties you may feel during this time",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  MonthItemList(
                    text: "Shortness of breath - This is because the space in your abdomen tightens as your uterus grows.",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Varicose veins",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Aching feet",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Excessive fatigue",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Need to urinate frequently",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Stress or anxiety.",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),
                  MonthItemList(
                    text: "Braxton Hicks contractions",
                    iconColor: Colors.purple,
                    fontColor: Colors.deepPurpleAccent,
                    leadingIcon: Icons.star_border,
                  ),

                  SizedBox(height: 10,),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Maternal mental health",
                            style: TextStyle(fontSize: 18, color: lightBlue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Paragraph(
                    color: darkBlue,
                    text:
                        "  In addition to physical changes, you may also feel anxious about the end of your pregnancy. It's normal to feel that you are ready to meet your child. However you may feel afraid just thinking about future challenges and changes. At the end of the day or when you feel stressed, do some fun activities to relax your body and mind. Strategies to relax your mind are as simple as listening to music or reading a book. Or you can get your belly massaged. Yoga and meditation before childbirth are also very good activities. "
                            "Always engage in activities which bring you happiness and calmness.",
                  ),
                  Paragraph(
                    color: darkBlue,
                    text:
                        "  During this month or even during the previous month, you may experience labour pains at any time. Therefore you should be very careful. You do not have to be afraid. Even if your baby is born in the eighth month of the pregnancy, modern treatment is available to care for the baby in an "
                            "incubator in the NICU until he is ready for the external environment.",
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

                  Paragraph(
                    color: Colors.pinkAccent,
                    text:
                        "  As discussed in the seventh month, give your support to your wife during this time as well. Keep her as happy as possible. Dedicate yourself to her mental as well as physical well-being. As mentioned earlier, make sure your child and wife have all the facilities they need, well in advance. Whenever possible you should rub her abdomen. Being close to her by providing her with the conditions she needs for a healthy delivery will "
                            "undoubtedly help her mental level as well as a successful delivery.",
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
